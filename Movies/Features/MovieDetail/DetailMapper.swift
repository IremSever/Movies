//
//  Mapper.swift
//  Movies
//
//  Created by İrem Sever on 13.10.2024.
//
import Foundation

struct DetailMapper {
    func map(entity: DetailMoviesEntity) -> DetailMovieViewModel {
        return DetailMovieViewModel(
            title: entity.title,
            overview: entity.overview,
            backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath)
        )  
    }
}
