//
//  MoviesPresenter 2.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//


class MoviesPresenter {
    weak var moviesUi: MoviesPresenterUI?
    private let moviesInteractor: MoviesInteractable
    private let mapper: Mapper
    var viewModels: [MovieViewModel] = []

    init(moviesInteractor: MoviesInteractable, mapper: Mapper = Mapper()) {
        self.moviesInteractor = moviesInteractor
        self.mapper = mapper
    }

    func onViewAppear() async {
        do {
            let moviesResponse = try await moviesInteractor.getMovies()
            didFetchMovies(moviesResponse)
        } catch {
            didFailToFetchMovies(error)
        }
    }

    func didFetchMovies(_ response: MoviesResponseEntity) {
        let model = response.results
        viewModels = model.map { mapper.map(entity: $0) }
        
        // UI'yi güncellerken ana thread'i kullan
        DispatchQueue.main.async {
            self.moviesUi?.update(movies: self.viewModels)
        }
    }

    func didFailToFetchMovies(_ error: Error) {
        print("Failed to fetch movies: \(error.localizedDescription)")
    }
}
