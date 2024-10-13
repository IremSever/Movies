//
//  MoviesEntity.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation

struct MoviesEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imgURL: String
    var votes: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imgURL = "poster_path"
        case votes = "vote_average"
    }
}
