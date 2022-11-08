//
//  Network.swift
//  moshtary
//
//  Created by admin on 1/17/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkLayer {
    func request<T: Codable>(_ request: Request, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
        AF.request(request.path, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers, interceptor: nil).responseData { response  in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func upload<T: Codable>(_ request: Request, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> (), progressCompletion: @escaping (_: Progress) -> () = {_ in} ) {
        
        AF.upload(multipartFormData: { encode in
            request.images.forEach { // images encoded ...
                if let data = $1.jpegData(compressionQuality: 1.0) {
                    encode.append(data, withName: $0, fileName: $0, mimeType: "images/*")
                }
            }
            request.parameters.forEach {
                if let value = $1 as? String, let data = value.data(using: .utf8) {
                    encode.append( data , withName: $0)
                }
            }
        }, to: request.path).uploadProgress { progress in
            progressCompletion(progress)
            
        }.responseJSON { result in
            debugPrint(result)
            switch result.result {
            case .success(let data) :
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let decoded = try JSONDecoder().decode(T.self, from: jsonData)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
                break
            case .failure(let error) :
                completionHandler(.failure(error))
                break
            }
        }
        
    }
    
}
