//
//  MoviesRouter 2.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//


import Foundation
import UIKit

class MoviesRouter {
    func showMovies(window: UIWindow?) {
        let view = MoviesView() 
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(moviesInteractor: interactor)
        presenter.moviesUi = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
