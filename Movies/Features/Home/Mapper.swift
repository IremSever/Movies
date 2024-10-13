//
//  Mapper.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//
import Foundation

struct Mapper {
    func map(entity: MoviesEntity) -> MovieViewModel {
        return MovieViewModel(
            title: entity.title,
            overview: entity.overview,
            imgURL: URL(string: "https://image.tmdb.org/t/p/w500" + entity.imgURL),
            votes: entity.votes 
        )
    }
} 
