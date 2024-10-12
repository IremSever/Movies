//
//  BaseView.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import UIKit

class BaseView<T: UIViewController>: UIView {
    var controller: T
    
    init (_ controller:T) {
        self.controller = controller
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
}
