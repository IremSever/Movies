//
//  NetworkManager.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import Alamofire
//6d54658d0c43c9cf921c884b571c0c4a
/*
 struct PopularMovieEntity: Decodable {
 var  id: Int
var title: String
 var overview: String
 var imgURL: String
 var votes: Double
 
 enum CodingKeys: String, CodingKeys {
 case id, title, overview
 case imgeURL = "poster_path"
 case votes
 }

final class NetworkManager: NetworkManagerProtocol {
    private let config: NetworkConfig
    private let decoder: JSONDecoder
    
    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()) {
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    /// Send your request
    /// - Parameters:
    ///   - path: Network Path
    ///   - method: HttpMethod
    ///   - type: Generic Decodable Type
    ///   - body: Nullable or Encodable
    ///   - paramater: Query parms. etc.
    /// - Returns: Result with sucses responre or error
    func send<T: Decodable>(path: NetworkPathProtocol, method: NetworkMethod, type: T.Type, body: Encodable? = nil, paramater: Parameters? = nil) async -> Result<T, Error> {
        
        let url = config.baseUrl + path.value
        let reqeust: DataRequest
        
        // TODO: Seperate client object
        if let body = body {
            reqeust = AF.request(
                url,
                method: method.alamofireMethod,
                parameters: body,
                encoder: JSONParameterEncoder.default
            )
        } else {
            reqeust = AF.request(
                url,
                method: method.alamofireMethod,
                parameters: paramater
            )
        }
        
        let response = await reqeust.validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
        
        guard let responseValue = response.value else {
            return .failure(response.error ?? NetworkError.unkown)
        }
        
        return .success(responseValue)
    }
    
}

