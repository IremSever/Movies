//
//  MoviesView.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//


class MoviesView: UIViewController {
    var router: DetailMoviesRouting?

    func didSelectMovie(movieId: String) {
        router?.navigate(to: .detail(movieId: movieId))
    }
}
