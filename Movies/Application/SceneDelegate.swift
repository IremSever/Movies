//
//  SceneDelegate.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var moviesRouter = MoviesRouter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        moviesRouter.showMovies(window: window)
    }
}

