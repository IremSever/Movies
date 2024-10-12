//
//  MoviesRouter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import UIKit

class MoviesRouter: PresenterToRouterMoviesProtocol {
    static func createModule() -> UIViewController {
        let viewController = MoviesViewController()
        let presenter = ViewToPresenterMoviesProtocol & InteractorToPresenterMoviesProtocol = MoviesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MoviesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MoviesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
