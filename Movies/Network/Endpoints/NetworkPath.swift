//
//  NetworkPath.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation


enum NetworkPath: String, NetworkPathProtocol {
    case login = "/login"

    var value: String {
        self.rawValue
    }
}

protocol NetworkPathProtocol {
    var value: String { get }
}
