//
//  ExploreHeadersTableViewCell.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class ExploreHeadersTableViewCell: UITableViewCell {

    static let identifier = "ExploreHeadersTableViewCell"
    
    private let titleTop5: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
}
