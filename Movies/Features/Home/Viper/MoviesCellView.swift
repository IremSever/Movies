//
//  MovieCellView.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//

import Foundation
import UIKit
import Kingfisher

class MoviesCellView: UICollectionViewCell {
    
    // Create movie image view
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Create movie name label
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Create movie description label
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Create rating label
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Initialize the cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup the cell's view hierarchy and constraints
    func setupView() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieName)
        contentView.addSubview(movieDescription)
        contentView.addSubview(ratingLabel) // Make sure to add the ratingLabel

        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 250),

            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            movieName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            ratingLabel.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 4),
            ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            movieDescription.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            movieDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8) // Optional for spacing
        ])
    }
    
    // Configure the cell with data
    func configure(model: MovieViewModel) {
        movieImageView.kf.setImage(with: model.imgURL)
        movieName.text = model.title
        ratingLabel.text = "⭐ \(Float(model.votes))"
    }
}
