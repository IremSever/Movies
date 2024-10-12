//
//  NewsController.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import Foundation
import UIKit

class MoviesViewController: UIViewController, NavigationView {
    var presenter: ViewToPresenterMoviesProtocol?
    
    override func viewDidLoad() {
        
    }
}

extension MoviesViewController: PresenterToViewMoviesProtocol {
    
}
