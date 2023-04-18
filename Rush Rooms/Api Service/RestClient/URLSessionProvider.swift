//
//  ConstantTexts.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//


import Foundation


extension URLComponents {

    init(service: ServiceProtocol) {
        var url = service.baseURL
        if service.path.isEmpty == false{
            url = service.baseURL.appendingPathComponent(service.path)
        }
        self.init(url: url, resolvingAgainstBaseURL: false)! // 2
        
        switch (service.task,service.parametersEncoding){
    
        case (let .requestParameters(parameters), .url):
            queryItems = parameters.map { key, value in
                return URLQueryItem(name: key, value: String(describing: value))
            }
            
        case (let .requestComboParameters(_, queryParam), .urlAndJson):
            queryItems = queryParam.map { key, value in
                return URLQueryItem(name: key, value: String(describing: value))
            }
        
            
        case (let .requestMultiPartParameters(_, queryParam,_,_,_,_), .multipartFormData):
            queryItems = queryParam.map { key, value in
                return URLQueryItem(name: key, value: String(describing: value))
            }
        case (_,_):
            return
        }
    }
}

extension URLRequest {

    init(service: ServiceProtocol) {
        let urlComponents = URLComponents(service: service) // 1
        self.init(url: urlComponents.url!) // 2
        httpMethod = service.method.rawValue // 3
        service.headers?.forEach { key, value in // 4
            if service.parametersEncoding == .multipartFormData {
                debugPrint("**")
            } else{
                addValue(value, forHTTPHeaderField: key)
            }
            
        }

        switch (service.task,service.parametersEncoding){
            
        case (let .emptyRequestParameters(parms), .json):
            let  jsonData = try? JSONSerialization.data(withJSONObject: parms, options: .prettyPrinted)
            if jsonData !=  nil{
                let jsonString = String.init(data: jsonData!, encoding: .utf8)
                print(jsonString as Any)
            }
            self.httpBody =  jsonData
            
        case (let .requestParameters(parameters), .json):
            let  jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            if jsonData !=  nil{
                let jsonString = String.init(data: jsonData!, encoding: .utf8)
                print(jsonString as Any)
            }
            self.httpBody =  jsonData
            
        case (let .requestComboParameters(bodyParam, _), .urlAndJson):
            let  jsonData = try? JSONSerialization.data(withJSONObject: bodyParam, options: .prettyPrinted)
            if jsonData !=  nil{
                let jsonString = String.init(data: jsonData!, encoding: .utf8)
                print(jsonString as Any)
            }
            self.httpBody =  jsonData
            
        case (let .requestArrayParameters(bodyParam), .json):
            let  jsonData = try? JSONSerialization.data(withJSONObject: bodyParam, options: .prettyPrinted)
            if jsonData !=  nil{
                let jsonString = String.init(data: jsonData!, encoding: .utf8)
                print(jsonString as Any)
            }
            self.httpBody =  jsonData
            
        case (_,_):
            return
        }

    }
}

final class URLSessionProvider:NSObject, RequestProviderProtocol {

    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable {
        var request = URLRequest(service: service)
        request.timeoutInterval = 20
        print(">>> \(request.curlString) <<<")
        let task = session.dataTask(request: request, completionHandler: { [weak self] dataaa, response, error in
            let httpResponse = response as? HTTPURLResponse
            debugPrint("statusCode --> \(String(describing: httpResponse?.statusCode))")
            debugPrint("data --> \(String(describing: dataaa))")
            if let dataa = dataaa {
                let jsonString = String(data: dataa, encoding: .isoLatin1)
                print(jsonString ?? "", separator: " *********** \n\n API RESPONSE STRING \n\n", terminator: "\n\n RESPONSE PRINT ENDED \n\n ******** ")
            }
            self?.handleDataResponse(data: dataaa, response: httpResponse, error: error, type:type,service: service,completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?,type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) {
        if (error as? URLError)?.code == .timedOut {
            completion(.failure(NetworkError.TimeOut))
           return
        }
        if let error = error {
           return completion(.failure(.OtherError(error: error)))
       }
        guard let response = response else { return completion(.failure(.noJsonData)) }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else { return completion(.failure(.unknown)) }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
                 let model = try JSONDecoder().decode(T.self, from: data)
                 completion(.success(model))
            }catch {
                _ = String(data: data, encoding: String.Encoding.isoLatin1)
                print(error)
                completion(.failure(.MsgError(error: error.localizedDescription)))
            }
            
        case 400...404:
            guard let data = data else { return completion(.failure(.unknown)) }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
                 let model = try JSONDecoder().decode(T.self, from: data)
                 completion(.success(model))
            }catch {
                _ = String(data: data, encoding: String.Encoding.isoLatin1)
                print(error)
                completion(.failure(.MsgError(error: error.localizedDescription)))
            }
        default:
            guard let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return completion(.failure(NetworkError.MsgError(error: "\(response.statusCode)"))) }
            let err  = getErrorCode(json: json as! [String : Any])
            if case .appError(let error) = err {
                switch error {
                case .SUSPENDED_ACCOUNT:
                    break
                default:
                    completion(.failure(err))
                }
            }else{
                completion(.failure(err))
            }
        }
    }
    
    func requestRawResponse(service: ServiceProtocol, completion: @escaping (NetworkResponsePlain) -> ()){
        var request = URLRequest(service: service)
        request.timeoutInterval = 20
        if service.parametersEncoding == .multipartFormData {
            request.setValue("multipart/form-data;boundary=\(service.boundry!)", forHTTPHeaderField: "Content-Type")
            service.headers?.forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        print(">>> \(request.curlString) <<<\n")
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            debugPrint("statusCode --> \(String(describing: httpResponse?.statusCode))")
            if let dataa = data {
                let jsonString = String(data: dataa, encoding: .utf8)
                print(jsonString ?? "", separator: " *********** \n\n API RESPONSE STRING \n\n", terminator: "\n\n RESPONSE PRINT ENDED \n\n ******** ")
            }
            self?.handleDataResponsePlain(data: data, response: httpResponse, error: error, service: service, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponsePlain(data: Data?, response: HTTPURLResponse?, error: Error?, service: ServiceProtocol,completion: @escaping (NetworkResponsePlain) -> ()) {
        if (error as? URLError)?.code == .timedOut {
            completion(.failure(NetworkError.TimeOut))
           return
        }
         if let error = error {
            return completion(.failure(.OtherError(error: error)))
        }
        
        guard let response = response else { return completion(.failure(.noJsonData)) }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else {
                return completion(.success((Any).self))
            }
            do {
                if data.count == 0 {
                    completion(.success((Any).self))
                } else {
                    let json = try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.mutableContainers])
                    let jsonString = String(data: data, encoding: .utf8)
                    print(jsonString ?? "", separator: " *********** \n\n API RESPONSE STRING \n\n", terminator: "\n\n RESPONSE PRINT ENDED \n\n ******** ")
                    completion(.success(json))
                }
            }catch {
                // data is not json
                let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
                print(error)
                return completion(.success(data))
            }
           
        default:
            guard let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return completion(.failure(NetworkError.MsgError(error: "\(response.statusCode)"))) }
            let err  = getErrorCode(json: json as! [String : Any])
            if case .appError(let error) = err {
                switch error {
                case .SUSPENDED_ACCOUNT:
                    break
                default:
                    completion(.failure(err))
                }
            }else{
                completion(.failure(err))
            }
        }
    }
    
    func downloadImageDataWithCache(url:URL,callback:@escaping(Data?,Error?)->()){
        
        let request  = URLRequest.init(url:url , cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: TimeInterval.init(60))
        let task  = session.dataTask(request: request) { data, response, err in
            if let response = response,let data = data {
                let cacheResponse  = CachedURLResponse.init(response: response, data: data)
                URLCache.shared.storeCachedResponse(cacheResponse, for: request)
            }
            
            callback(data,err)
            
        }
        task.resume()
    }
    
    func requestDownloadFromURL(url:URL,completion: @escaping (NetworkResponsePlain) -> ()) -> Void {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url:url, cachePolicy: URLRequest.CachePolicy.reloadRevalidatingCacheData, timeoutInterval: TimeInterval.init(60))
     
        let task  = session.downLoadTask(request: request) { [weak self] localURL, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDownloadResponse(localurl: localURL, response: httpResponse, error: error, completion: completion)
        }
        task.resume()
    }
    
    func handleDownloadResponse(localurl: URL?, response: HTTPURLResponse?, error: Error?, completion: @escaping (NetworkResponsePlain) -> ()){
        
        if let error = error {
           return completion(.failure(.OtherError(error: error)))
        }
        
        guard let response = response else { return completion(.failure(.noJsonData)) }
        
        switch response.statusCode {
        case 200...299:
            if let localurl = localurl {
                completion(.success((localurl).self))
            }
        
        default:
            return completion(.failure(.unknown))
        }
    }
    
    func requestDownloadResponse(service: ServiceProtocol, completion: @escaping (NetworkResponsePlain) -> ()){
        var request = URLRequest(service: service)
        request.timeoutInterval = 20
        print(">>> \(request.curlString) <<<\n")
        let task  = session.downLoadTask(request: request) { [weak self] localURL, response, error in
            let httpResponse = response as? HTTPURLResponse
            if let url = localURL {
                
            }
            
            self?.handleDownloadResponse(localurl: localURL, response: httpResponse, error: error, service: service, completion: completion)
        }
        task.resume()
    }
    
    func handleDownloadResponse(localurl: URL?, response: HTTPURLResponse?, error: Error?, service: ServiceProtocol,completion: @escaping (NetworkResponsePlain) -> ()){
        
        if let error = error {
           return completion(.failure(.OtherError(error: error)))
        }
        
        guard let response = response else { return completion(.failure(.noJsonData)) }
        
        switch response.statusCode {
        case 200...299:
            if let localurl = localurl {
                completion(.success((localurl).self))
            }
        
        default:
            return completion(.failure(.unknown))
        }
    }
}

extension URLSessionProvider{
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void){
        print("received authentication challenge for host \(challenge.protectionSpace.host)")
        let hostName: String = challenge.protectionSpace.host
        let serverTrust = challenge.protectionSpace.serverTrust
        let count  = SecTrustGetCertificateCount(serverTrust!)
        let rootCertificateIndex  =  count - 1
        let certificate = SecTrustGetCertificateAtIndex(serverTrust!, rootCertificateIndex)
        
        // Set SSL policies for domain name check
        let policies = NSMutableArray();
        policies.add(SecPolicyCreateSSL(true, (challenge.protectionSpace.host as CFString)))
        SecTrustSetPolicies(serverTrust!, policies);
        
        // Evaluate server certificate
        var result: SecTrustResultType = SecTrustResultType(rawValue: 0)!
        SecTrustEvaluate(serverTrust!, &result)
        let isServerTrusted:Bool = (result == .unspecified || result == .proceed)
        var isHostNameValidated : Bool = false
        // Get local and remote cert data
        let remoteCertificateData:NSData = SecCertificateCopyData(certificate!)
        var pathToCert: String?// = ""
        #if dev
        pathToCert = Bundle.main.path(forResource: "dev", ofType: "cer")
        isHostNameValidated = hostName.contains("dev.platform.quboweb.com")
        #elseif stage
        pathToCert = Bundle.main.path(forResource: "stage", ofType: "cer")
        isHostNameValidated = hostName.contains("stage.platform.quboworld.com")
        #elseif PP2
        pathToCert = Bundle.main.path(forResource: "prod2", ofType: "cer")
        isHostNameValidated = hostName.contains("obotworld-deviceplatform.com")
        
        #elseif prod
        pathToCert = Bundle.main.path(forResource: "prod", ofType: "der")
        isHostNameValidated = hostName.contains("platform.quboworld.com")
        #endif
        
        let localCertificate:NSData = NSData(contentsOfFile: pathToCert!)!
        
        if (isServerTrusted && isHostNameValidated && remoteCertificateData.isEqual(to: localCertificate as Data)) {
            print("validated challenge")
            let credential:URLCredential = URLCredential(trust: serverTrust!)
            completionHandler(.useCredential, credential)
        } else {
            print("failed challenge")
            #if dev
            let credential:URLCredential = URLCredential(trust: serverTrust!)
            completionHandler(.useCredential, credential)
            return
            #elseif stage
            let credential:URLCredential = URLCredential(trust: serverTrust!)
            completionHandler(.useCredential, credential)
            return
            #elseif PP2
            let credential:URLCredential = URLCredential(trust: serverTrust!)
            completionHandler(.useCredential, credential)
            return
            #endif
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
