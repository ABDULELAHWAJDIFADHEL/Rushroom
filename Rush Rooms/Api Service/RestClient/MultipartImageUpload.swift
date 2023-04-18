//
//  ConstantTexts.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//


import Foundation
import UIKit

func uploadImage(userID: String ,imageData: Data,completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ) {
    //let urlStr = "https://srvc.dev.platform.quboweb.com:443/sms/api/v1/sp/d10e4bfb0153496e8e8bb955f7ebe413/users/4f188034-be41-41be-aa14-f6067cc3be02/image"
    let urlStr = AppConfig.getServiceHostURL() + String.init(format: UserServices.UserLogin)
//    AppLogger.info("Profile Image URL --> \(urlStr)")
    let request = MultipartFormDataRequest(url: URL(string: urlStr)!)
    request.addDataField(named: "image", data: imageData, mimeType: "image/jpeg")
    URLSession.shared.dataTask(with: request, completionHandler: {responseData, response, error  in
        completionHandler(responseData,response,error)
    }).resume()
}

struct MultipartFormDataRequest {
    private let boundary: String = UUID().uuidString
    private var httpBody = NSMutableData()
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func addDataField(named name: String, data: Data, mimeType: String) {
        httpBody.append(dataFormField(named: name, data: data, mimeType: mimeType))
    }
    
    private func dataFormField(named name: String, data: Data, mimeType: String) -> Data {
        let fieldData = NSMutableData()
//        fieldData.append("\r\n--\(boundary)\r\n")
//        fieldData.append("Content-Disposition: form-data; name=\"\(name)\";filename=\"image.jpg\"\r\n")
//        fieldData.append("Content-Type: \(mimeType)\r\n")
//        fieldData.append("\r\n")
//        fieldData.append(data)
//        fieldData.append("\r\n--\(boundary)--\r\n")
        return fieldData as Data
    }
    
    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        
        let result =  ["Subscriber-Key" : "" ,
                       "Token-Type" : "USER",
                       "User-UUID" : "",
                       "Source-Device-Id" : UIDevice.current.identifierForVendor?.uuidString ?? "",
                       "App-Id" : "",
                       "Source" : "IOS",
                       "App-Type": "GO"
        ]
        request.httpMethod = "POST"
        request.timeoutInterval = 300
        request.setValue("multipart/form-data;boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        result.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
            print("--------> \(key) -----> \(value)")
        }
        request.httpBody = httpBody as Data
        return request
    }
}
