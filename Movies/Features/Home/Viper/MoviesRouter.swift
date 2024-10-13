//
//  MoviesRouter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
import Foundation
import UIKit

protocol MoviesRouterProtocol: AnyObject {
    var detailRouter: DetailRouting? { get }
    var moviesView: MoviesView? { get }

    func showMovies(window: UIWindow?)
    func showDetailMovies(withMovieId movieId: String)
}

class MoviesRouter: MoviesRouterProtocol {
    var detailRouter: DetailRouting?
    var moviesView: MoviesView?
    
    func showMovies(window: UIWindow?) {
        // Initialize detail router
        self.detailRouter = DetailMoviesRouter()
        
        // Initialize the interactor, presenter, and view
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(moviesInteractor: interactor, router: self)
        
        // Ensure that the presenter conforms to `MoviesPresentable`
        moviesView = MoviesView(presenter: presenter)
        presenter.moviesUi = moviesView

        // Set the view as the root view controller of the window
        window?.rootViewController = moviesView
        window?.makeKeyAndVisible()
    }

    func showDetailMovies(withMovieId movieId: String) {
        guard let fromViewViewController = moviesView else { return }
        detailRouter?.showDetail(fromViewViewController: fromViewViewController, withMovield: movieId)
    }
}
