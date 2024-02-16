// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - properties

    var window: UIWindow?

    // MARK: - public methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let tabBarVC = TabBarViewController()
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }
}
