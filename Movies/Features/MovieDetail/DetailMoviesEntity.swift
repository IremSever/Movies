//
//  MoviesEntity.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
struct DetailMoviesEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey { 
        case title, overview
        case backdropPath = "backdrop_path"
        case status
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}
