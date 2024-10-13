//
//  MoviesView.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//
import Foundation
import UIKit
import Kingfisher

class DetailMoviesView: UIViewController {
    private let presenter: DetailPresentable

    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular, width: .standard)
        label.textColor = .black // Changed for better visibility
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView() // Ensure views are added to the hierarchy before activating constraints
        presenter.onViewAppear()
    }
    
    private func setupView() {
        // Add all subviews to the view
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieDescription)

        // Activate constraints after adding views
        NSLayoutConstraint.activate([
            // Adding top anchor to safe area to avoid notches
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieImageView.heightAnchor.constraint(equalToConstant: 300),

            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),

            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            movieDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20) // Optional for spacing
        ])
    }
}

extension DetailMoviesView: DetailPresenterUI {
    func updateUI(viewModel: DetailMovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.backdropPath)
        movieName.text = viewModel.title
        movieDescription.text = viewModel.overview
    }
}
