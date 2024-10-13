//
//  MoviesInteractor.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
import Foundation
import Alamofire

protocol MoviesInteractable: AnyObject {
    func getMovies() async throws -> MoviesResponseEntity
}
class MoviesInteractor: MoviesInteractable {
    func getMovies() async throws -> MoviesResponseEntity {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=6d54658d0c43c9cf921c884b571c0c4a"
        
        let response = await AF.request(url).validate().serializingDecodable(MoviesResponseEntity.self).response
        
        switch response.result {
        case .success(let moviesResponse):
            print("API Response: \(moviesResponse.results)") // Yanıtı burada logluyoruz
            return moviesResponse
        case .failure(let error):
            print("API Error: \(error)") // Hata kontrolü
            throw error
        }
    }
}
class MoviesInteractorMock: MoviesInteractable {
    func getMovies() async -> MoviesResponseEntity {
        return MoviesResponseEntity(results: [
            .init(id: 0, title: "SwiftBeta Suscribete", overview: "Aprende Swift", imgURL: "", votes: 10),
            .init(id: 1, title: "SwiftBeta Suscribete", overview: "Aprende SwiftUI", imgURL: "", votes: 10),
            .init(id: 2, title:"SwiftBeta Suscribete", overview: "Aprende Xcode", imgURL: "", votes: 10),
            .init(id: 3, title: "SwiftBeta Suscribete", overview: "Aprende UIKit", imgURL: "", votes: 10),
            .init(id: 4, title: "SwiftBeta Suscribete", overview: "Aprende Firebase", imgURL: "", votes: 10),
            .init(id: 5, title: "SwiftBeta Suscribete", overview: "Aprende Combine", imgURL: "", votes: 10),])
    }
}
