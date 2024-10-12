//
//  NavigationViewProtocol.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//

import Foundation
import UIKit

protocol NavigationView {
    func present(_ viewController: UIViewController)
    func dismiss()
}

extension NavigationView where Self: UIViewController{
    func present(_ viewController:UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}
