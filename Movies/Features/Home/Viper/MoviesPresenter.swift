//
//  MoviesPresenter.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//
import Foundation

protocol MoviesPresentable: AnyObject {
    var moviesUi: MoviesPresenterUI? { get }
    var viewModels: [MovieViewModel] { get }
    func onViewAppear() async
    func onTapCell(atIndex: Int)
}

protocol MoviesPresenterUI: AnyObject {
    func update(movies: [MovieViewModel])
}

// Updated MoviesPresenter to conform to MoviesPresentable
class MoviesPresenter: MoviesPresentable {
    weak var moviesUi: MoviesPresenterUI?
    private let moviesInteractor: MoviesInteractable
    private var models: [MoviesEntity] = []
    private let mapper: Mapper
    var viewModels: [MovieViewModel] = []
    private var router: MoviesRouterProtocol

    init(moviesInteractor: MoviesInteractable, mapper: Mapper = Mapper(), router: MoviesRouterProtocol) {
        self.moviesInteractor = moviesInteractor
        self.mapper = mapper
        self.router = router
    }

    func onViewAppear() async {
        do {
            let moviesResponse = try await moviesInteractor.getMovies()
            didFetchMovies(moviesResponse)
        } catch {
            didFailToFetchMovies(error)
        }
    }
    
    func onTapCell(atIndex index: Int) {
        let selectedMovie = viewModels[index] // Tıklanan filmin view modelini al
        router.showDetailMovies(withMovieId: String(selectedMovie.id)) // Filmin id'sini router ile gönder
    }

    private func didFetchMovies(_ response: MoviesResponseEntity) {
        let model = response.results
        viewModels = model.map { mapper.map(entity: $0) }

        print("Mapped Movies Count: \(viewModels.count)")

        DispatchQueue.main.async {
            self.moviesUi?.update(movies: self.viewModels)
        }
    }
    

    private func didFailToFetchMovies(_ error: Error) {
        print("Failed to fetch movies: \(error.localizedDescription)")
    }
}
