// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка таб бара и навигации
final class TabBarController: UITabBarController {
    // MARK: - Constants

    private enum Constant {
        static let newsLine = "Лента"
        static let notifications = "Уведомления"
        static let profile = "Профиль"
    }

    // MARK: - Private properties

    private let newsLineViewController = NewslineViewController()
    private let notificationsViewController = NotificationsViewController()
    private let profileViewController = ProfileViewController()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTabBar()
        setupNavBarIcons()
    }

    // MARK: - Private methods

    private func setup() {
        newsLineViewController.tabBarItem = UITabBarItem(title: Constant.newsLine, image: .housePicked, tag: 0)
        notificationsViewController.tabBarItem = UITabBarItem(title: Constant.notifications, image: .noti, tag: 1)
        profileViewController.tabBarItem = UITabBarItem(title: Constant.profile, image: .profil, tag: 3)
    }

    private func setupTabBar() {
        delegate = self
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.systemGray4.cgColor
        tabBarController?.tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black

        let navNewsLineViewController = UINavigationController(rootViewController: newsLineViewController)
        let navNotificationsViewController = UINavigationController(rootViewController: notificationsViewController)
        let navProfileViewController = UINavigationController(rootViewController: profileViewController)

        viewControllers = [navNewsLineViewController, navNotificationsViewController, navProfileViewController]
    }

    private func setupNavBarIcons() {
        newsLineViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .chatIcon.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        newsLineViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: .rmLink.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
    }
}

// MARK: - Extension UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 0 {
            tabBar.items?[0].image = .housePicked.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[0].image = .house.withRenderingMode(.alwaysOriginal)
        }

        if selectedIndex == 1 {
            tabBar.items?[1].image = .notiPicked.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[1].image = .noti.withRenderingMode(.alwaysOriginal)
        }

        if selectedIndex == 2 {
            tabBar.items?[2].image = .profil.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[2].image = .profil.withRenderingMode(.alwaysOriginal)
        }
    }
}
