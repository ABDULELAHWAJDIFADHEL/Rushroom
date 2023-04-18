//
//  ConstantTexts.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//


import Foundation

typealias Headers = [String: String]

protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
    var boundry:String? { get }
}

extension ServiceProtocol{
    var boundry: String?{
        return nil
    }
}


protocol RequestProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
    func requestRawResponse(service: ServiceProtocol, completion: @escaping (NetworkResponsePlain) -> ())
    func requestDownloadResponse(service: ServiceProtocol, completion: @escaping (NetworkResponsePlain) -> ())
}


protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    typealias DownloadTaskResult = (URL?, URLResponse?, Error?) -> ()
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func downLoadTask(request: URLRequest, completionHandler: @escaping DownloadTaskResult) -> URLSessionDownloadTask
}

extension URLSession: URLSessionProtocol {
    func downLoadTask(request: URLRequest, completionHandler: @escaping DownloadTaskResult) -> URLSessionDownloadTask {
        return downloadTask(with: request, completionHandler: completionHandler)
    }
    
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}

extension URLSession {
    func dataTask(with request: MultipartFormDataRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    -> URLSessionDataTask {
        return dataTask(with: request.asURLRequest(), completionHandler: completionHandler)
    }
}

class RefrenceAPIService:ServiceProtocol{
    let oldService:ServiceProtocol!
    var _baseURL:URL
    var _path: String
    var _method: HTTPMethod
    var _task: Task
    var _headers: Headers?
    var _parametersEncoding: ParametersEncoding
    init(from:ServiceProtocol) {
         oldService = from
        _baseURL = oldService.baseURL
        _path = oldService.path
        _method = oldService.method
        _task = oldService.task
        _headers = oldService.headers
        _parametersEncoding = oldService.parametersEncoding
    }
    var baseURL: URL{
        get{
            return _baseURL
        }
        set{
            _baseURL = newValue
        }
        
    }
    
    var path: String{
        get{
            return _path
        }
        set{
            _path = newValue
        }
    }
    
    var method: HTTPMethod{
        get{
            return _method
        }
        set{
            _method = newValue
        }
    }
    
    var task: Task{
        get{
            return _task
        }
        set{
            _task = newValue
        }
    }
    
    var headers: Headers?{
        get{
            return _headers
        }
        set{
            _headers = newValue
        }
    }
    
    var parametersEncoding: ParametersEncoding{
        get{
            return _parametersEncoding
        }
        set{
            _parametersEncoding = newValue
        }
    }
}
