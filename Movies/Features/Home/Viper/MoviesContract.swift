//
//  MoviesContract.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation

protocol PresenterToViewMoviesProtocol {
    
}

protocol ViewToPresenterMoviesProtocol {
    
    var view: PresenterToViewMoviesProtocol? {get set}
    var interactor: PresenterToInteractorMoviesProtocol? {get set}
    var router: PresenterToRouterMoviesProtocol? {get set}

}

protocol PresenterToInteractorMoviesProtocol {
    var presenter: InteractorToPresenterMoviesProtocol? {get set}
}

protocol InteractorToPresenterMoviesProtocol {
    
}

protocol PresenterToRouterMoviesProtocol {
    
}

protocol RouterToPresenterMoviesProtocol {
    
}

class MoviesContract {
    
}
