//
//  MoviesRouter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
import Foundation
import UIKit
import Alamofire


protocol DetailRouting: AnyObject {
    func showDetail(fromViewViewController: UIViewController, withMovield movieId: String)
}
class DetailMoviesRouter: DetailRouting {
    func showDetail(fromViewViewController: UIViewController, withMovield movieId: String) {
        let interactor = DetailMoviesInteractor()
        let mapper = DetailMapper()
        let presenter = DetailMoviesPresenter(movieId: movieId, interactor: interactor, mapper: mapper)
        let view = DetailMoviesView(presenter: presenter)
        presenter.movieUi = view
        fromViewViewController.present(view, animated: true)
        print("dsfdfsdfsdf", movieId)
    }
}
