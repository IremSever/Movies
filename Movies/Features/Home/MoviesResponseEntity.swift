//
//  MoviesResponseEntity.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation

struct MoviesResponseEntity: Decodable {
    let results: [MoviesEntity]
}

