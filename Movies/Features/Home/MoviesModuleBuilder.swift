//
//  MoviesModuleBuilder.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//

import UIKit
import Foundation

class MoviesModuleBuilder {
    static func createModule() -> UIViewController {
        let presenter = MoviesPresenter(moviesInteractor: MoviesInteractor(), router: MoviesRouter(moviesView: <#MoviesView#>))
        let viewController = MoviesView(presenter: presenter as! MoviesPresentable)
        let router = MoviesRouter(moviesView: MoviesView(presenter: <#any MoviesPresentable#>)) // Assuming you have a router for handling navigation
        presenter.moviesUi = viewController
        viewController.router = router
        return viewController
    }
}
