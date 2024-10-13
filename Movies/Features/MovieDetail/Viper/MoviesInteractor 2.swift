//
//  MoviesInteractor 2.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//


import Foundation
import Alamofire

class MoviesInteractor {
    
    weak var presenter: MoviesPresenter?  // Presenter referansı (weak)
    
    func getMovies() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=6d54658d0c43c9cf921c884b571c0c4a"
        
        AF.request(url).validate().responseDecodable(of: MoviesResponseEntity.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                // Başarı durumunda presenter'a veri gönder
                self.presenter?.didFetchMovies(moviesResponse)
            case .failure(let error):
                // Hata durumunda presenter'a hata bilgisini ilet
                self.presenter?.didFailToFetchMovies(error)
            }
        }
    }
}
