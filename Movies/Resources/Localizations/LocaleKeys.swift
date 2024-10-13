//
//  LocaleKeys.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import Foundation

enum LocaleKeys: String {
    case welcomeMessage = "welcome"
    case welcomeUser = "welcome_user"
}

extension LocaleKeys {
    /// Localized your key
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }

    /// Localized your key
    /// - Parameter arguments: <#arguments
    /// - Returns: Value with params
    func localized(with arguments: CVarArg...) -> String {
        String(format: self.localized, arguments)
    }
}