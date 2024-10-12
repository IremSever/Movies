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
        let interactor = MoviesInteractor()
        let router = MoviesRouter(navigation: viewController)
        
        let presenter: ViewToPresenterMoviesProtocol & InteractorToPresenterMoviesProtocol = MoviesPresenter(interactor: interactor, router: router, view:viewController)
        
        viewController.presenter = presenter
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    let navigation: NavigationView
    
    init(navigation: NavigationView) {
        self.navigation = navigation
    }
    
    func navigationDetail() {
        
    }
}

