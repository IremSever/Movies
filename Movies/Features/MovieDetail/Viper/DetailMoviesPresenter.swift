//
//  MoviesPresenter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//
import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var movieUi: DetailPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailMoviesPresenter: DetailPresentable {
    weak var movieUi: DetailPresenterUI?
    let movieId: String
    private let interactor: DetailMoviesInteractable
    private let mapper: DetailMapper

    init(movieId: String, interactor: DetailMoviesInteractable, mapper: DetailMapper) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    
    }
    
    func onViewAppear() {
        Task {
            do {
                let model = try await interactor.getDetailMovie(withId: movieId)  
                let viewModel = mapper.map(entity: model)
                print(viewModel)
                await MainActor.run {
                    self.movieUi?.updateUI(viewModel: viewModel)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
