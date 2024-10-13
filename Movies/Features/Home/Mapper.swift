//
//  Mapper.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//
import Foundation

class Mapper {
    func map(entity: MoviesEntity) -> MovieViewModel {
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(entity.imgURL)")
        return MovieViewModel(
            id: entity.id,  // ID burada ekleniyor
            title: entity.title,
            overview: entity.overview,
            imgURL: imageURL,
            votes: entity.votes
        )
    }
}
