//
//  NetWorkTool.swift
//  DYZB
//
//  Created by jinhui song on 2019/1/25.
//  Copyright © 2019年 jinhui song. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

enum MethodType {
    case get
    case post
}

class NetWorkTool {
    
   
    
    static let sessionManager = { () -> SessionManager in
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        headers["content-type"] = "application/json"
        
        // custom session configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        
        return Alamofire.SessionManager(configuration: configuration)
    }
    
    class func requestData(URLString : String, type : MethodType, parameter : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let methodType:HTTPMethod = type == .get ? HTTPMethod.get : HTTPMethod.post
//        let dicHeader:HTTPHeaders = [ "Content-Type" : "application/text;charset=utf-8" ]

//        var headers = Alamofire.SessionManager.defaultHTTPHeaders
//        headers["content-type"] = "application/json"

        // custom session configuration
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = headers
//
//        let sessionManager = Alamofire.SessionManager(configuration: configuration)
//        sessionManager.delegate.sessionDidReceiveChallenge = {
//            session,challenge in
//            return    (URLSession.AuthChallengeDisposition.useCredential,URLCredential(trust:challenge.protectionSpace.serverTrust!))
//        }
        
        Alamofire.request(URLString, method: methodType, parameters: parameter)
            .responseJSON { response in
        
            guard case let .failure(error) = response.result else {
                
                // 3.获取结果
                guard let result = response.result.value else {
                    print((response.result.error)!)
                    return
                }
                // 4.将结果回调出去
                finishedCallback(result)
                return
            }

            if let error = error as? AFError {
                switch error {
                case .invalidURL(let url):
                    print("无效 URL: \(url) - \(error.localizedDescription)")
                case .parameterEncodingFailed(let reason):
                    print("参数编码失败: \(error.localizedDescription)")
                    print("失败理由: \(reason)")
                case .multipartEncodingFailed(let reason):
                    print("Multipart encoding 失败: \(error.localizedDescription)")
                    print("失败理由: \(reason)")
                case .responseValidationFailed(let reason):
                    print("Response 校验失败: \(error.localizedDescription)")
                    print("失败理由: \(reason)")

                    switch reason {
                    case .dataFileNil, .dataFileReadFailed:
                        print("无法读取下载文件")
                    case .missingContentType(let acceptableContentTypes):
                        print("文件类型不明: \(acceptableContentTypes)")
                    case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                        print("文件类型: \(responseContentType) 无法读取: \(acceptableContentTypes)")
                    case .unacceptableStatusCode(let code):
                        print("请求返回状态码出错: \(code)")
                    }
                case .responseSerializationFailed(let reason):
                    print("请求返回内容序列化失败: \(error.localizedDescription)")
                    print("失败理由: \(reason)")
                }

                print("错误: \(error.underlyingError!)")
            } else if let error = error as? URLError {
                print("URL 错误: \(error)")
            } else {
                print("未知错误: \(error)")
            }
            print("Success: \(response.result.isSuccess)")
            print("Response String:",response.description)

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
            
                print("Request: \(response.request!)")
                print("Response: \(response.response!)")

                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
                }

        }
    }
}
