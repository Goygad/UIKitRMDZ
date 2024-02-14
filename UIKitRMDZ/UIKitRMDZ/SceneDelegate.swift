// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navController = UINavigationController()
    let loginVC = LoginViewController()
    let menuVC = MenuController()
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        navController = UINavigationController(rootViewController: menuVC)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}
