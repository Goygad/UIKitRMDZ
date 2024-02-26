// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        setupSceneDelegate(scene)
    }

    // MARK: - Private Methods

    private func setupSceneDelegate(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabBarVC = TabBarController()
        self.window = window
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }
}
