//
//  ColorSet.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class ColorSet: NSObject {
    static let shared = ColorSet()
    
    func getSettingsBgColor() -> UIColor {
        return UIColor(named: "settingsBgColor") ?? .black
    }
    
}
