//
//  PopularTopicsCollectionViewCell.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class PopularTopicsCollectionViewCell: UICollectionViewCell {
    static let identifierPopularTopics = "PopularTopicsCollectionViewCell"
    
    let titlePopularTopic: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titlePopularTopic)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
