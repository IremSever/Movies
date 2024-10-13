//
//  NetworkMethod.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import Alamofire


enum NetworkMethod {
    case GET
    case POST
    case PUT
    
    var alamofireMethod: HTTPMethod {
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        }
    }
}
