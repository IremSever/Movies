//
//  MoviesResponseEntity.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation

struct DetailMoviesResponseEntity: Decodable {
    let results: [DetailMoviesEntity]
}

