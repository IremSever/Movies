//
//  CGFloat+Ext.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import Foundation
import UIKit

extension UIViewController {
    var screenWidth: CGFloat {
        return view.frame.size.width
    }
    var screenHeigth: CGFloat {
        return view.frame.size.height
    }
}
extension UIView {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    var screenHeigth: CGFloat {
        return UIScreen.main.bounds.height
    }
}
