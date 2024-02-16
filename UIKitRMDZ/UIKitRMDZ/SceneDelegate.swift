// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let profileViewController = ProfileViewController()
        let basketViewController = BasketViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let basketNavigationController = UINavigationController(rootViewController: basketViewController)
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([profileNavigationController, basketNavigationController], animated: true)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
