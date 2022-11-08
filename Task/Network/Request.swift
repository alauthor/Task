//
//  Request.swift
//  moshtary
//
//  Created by admin on 1/17/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import Foundation
import Alamofire

fileprivate let DOMAIN_URL = "http://40.127.194.127:5656/"

struct Request {
    
    var path : String {
        get {
            return DOMAIN_URL + endPodint.rawValue
        }
    }
    var endPodint: EndPoint = .medicationitems
    var parameters = [String: Any]()
    var encoding : ParameterEncoding = URLEncoding.default
    var method : HTTPMethod = .get
    let headers: HTTPHeaders = [
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    var images = [String: UIImage]()
    
    
    
}
