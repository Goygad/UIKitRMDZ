// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class TabBarController: UITabBarController {
    let viewController = MainViewController()
    let trafficLightStackViewController = TrafficLightStackViewController()
    let trafficLightAnchorViewController = TrafficLightAnchorViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }

    private func setupTabbar() {
        viewControllers = [viewController, trafficLightStackViewController, trafficLightAnchorViewController]
        viewController.tabBarItem.title = "Story"
        trafficLightStackViewController.tabBarItem.title = "Stack"
        trafficLightAnchorViewController.tabBarItem.title = "Anchor"
    }
}
