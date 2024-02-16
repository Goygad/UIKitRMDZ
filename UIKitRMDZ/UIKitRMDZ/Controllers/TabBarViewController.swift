// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Constants

    private enum Constant {
        static let catalog = "Каталог"
        static let cart = "Корзина"
        static let profile = "Профиль"
        static let shoes = "Обувь"
    }

    // MARK: - Private properties

    private let menulogViewController = MainMenuViewController()
    private let shoppingCartViewController = ShoppingCartViewController()
    private let profileViewController = ProfileViewController()
    private let catalogueViewController = CatalogueViewController()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        setupTabBar()
        setupNavBarIcons()
        setupControllers(
            index: 0,
            imageIcon: .selectedCatalog.withRenderingMode(.alwaysOriginal),
            title: Constant.catalog
        )
        setupControllers(index: 1, imageIcon: .cartTabBar.withRenderingMode(.alwaysOriginal), title: Constant.cart)
        setupControllers(index: 2, imageIcon: .profile.withRenderingMode(.alwaysOriginal), title: Constant.profile)
    }

    private func setupTabBar() {
        delegate = self
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.systemGray4.cgColor

        let catalogNavController = UINavigationController(rootViewController: menulogViewController)
        let shoppingCartNavController = UINavigationController(rootViewController: shoppingCartViewController)
        let profileNavController = UINavigationController(rootViewController: profileViewController)
        viewControllers = [
            catalogNavController,
            shoppingCartNavController,
            profileNavController
        ]
    }

    private func setupControllers(index: Int, imageIcon: UIImage, title: String) {
        if let tabBarItem = tabBar.items?[index] {
            tabBarItem.image = imageIcon
            tabBarController?.tabBar.tintColor = .black
            tabBarItem.title = title
            tabBar.tintColor = .selectedBar
            tabBar.unselectedItemTintColor = .black
        }
        menulogViewController.navigationController?.navigationBar.topItem?.title = Constant.catalog
        shoppingCartViewController.navigationController?.navigationBar.topItem?.title = Constant.cart
        profileViewController.navigationController?.navigationBar.topItem?.title = Constant.profile
    }

    private func setupNavBarIcons() {
        menulogViewController.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .code.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: nil),
            UIBarButtonItem(image: .photo.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: nil)
        ]
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 0 {
            tabBar.items?[0].image = .selectedCatalog.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[0].image = .catalog.withRenderingMode(.alwaysOriginal)
        }

        if selectedIndex == 1 {
            tabBar.items?[1].image = .selectedCart.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[1].image = .cartTabBar.withRenderingMode(.alwaysOriginal)
        }

        if selectedIndex == 2 {
            tabBar.items?[2].image = .selectedProfil.withRenderingMode(.alwaysOriginal)
        } else {
            tabBar.items?[2].image = .profile.withRenderingMode(.alwaysOriginal)
        }
    }
}
