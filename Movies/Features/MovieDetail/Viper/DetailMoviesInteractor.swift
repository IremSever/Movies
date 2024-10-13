//
//  MoviesInteractor.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
import Foundation
import Alamofire

protocol DetailMoviesInteractable: AnyObject {
    func getDetailMovie(withId id: String) async throws -> DetailMoviesEntity
}

class DetailMoviesInteractor: DetailMoviesInteractable {
    func getDetailMovie(withId id: String) async throws -> DetailMoviesEntity {
        let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=6d54658d0c43c9cf921c884b571c0c4a"
        
        let response = try await AF.request(url)
            .validate()
            .serializingDecodable(DetailMoviesEntity.self).value
        
        return response
    }
} 
