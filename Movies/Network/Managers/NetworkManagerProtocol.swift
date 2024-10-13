//
//  NetworkManagerProtocol.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//



import Alamofire
import Foundation

protocol NetworkManagerProtocol {
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable?,
        paramater: Parameters?
    ) async -> Result<T, Error>
}

extension NetworkManagerProtocol {
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        paramater: Parameters? = nil
    ) async -> Result<T, Error> {
        return await send(path: path, method: method, type: type, body: body, paramater: paramater)
    }
}
