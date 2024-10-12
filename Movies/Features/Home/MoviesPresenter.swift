//
//  MoviesPresenter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation

class MoviesPresenter: ViewToPresenterMoviesProtocol {
    
    var view: PresenterToViewMoviesProtocol?
    var interactor: PresenterToInteractorMoviesProtocol?
    var router: PresenterToRouterMoviesProtocol?
    
}
extension MoviesPresenter: InteractorToPresenterMoviesProtocol {
    
}
