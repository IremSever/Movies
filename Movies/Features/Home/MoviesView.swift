//
//  MoviesView.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import UIKit
import SnapKit

class MoviesView: BaseView<MoviesViewController> {
    
    override func setupView() {
        super.setupView()
        setupLayout()
    }
  
    private func setupLayout() {
        addSubview(labelTitleMovies) 
    }
    private lazy var labelTitleMovies: UILabel = {
        let label = UILabel()
        return label
    }()
    private func setupConstraints() {
        labelTitleMovies.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
