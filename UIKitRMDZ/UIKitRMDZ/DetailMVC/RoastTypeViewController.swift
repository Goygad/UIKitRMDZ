// RoastTypeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let darkRoastType = "Темная обжарка"
    static let lightRoastType = "Светлая обжарка"
    static let title = "Уточните обжарку зеренъ"
    static let coffeeColor = "AppCoffee"
    static let greyColor = "AppGrey"
    static let greenColor = "AppGreen"
    static let darkRoastImage = "dark_roast"
    static let lightRoastImage = "light_roast"
    static let cancel = "cancel"
}

protocol RoastTypeViewControllerDelegate: AnyObject {
    func modalViewControllerDidDismiss(roastType: String, roastImage: String)
}

/// RoastTypeViewController
final class RoastTypeViewController: UIViewController {
    weak var delegate: RoastTypeViewControllerDelegate?

    // MARK: - Private Properties

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 40,
            y: 53,
            width: 294,
            height: 30
        ))
        label.text = Constant.title
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    private lazy var lightRoastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 15,
            valueY: 102,
            width: 165,
            height: 165,
            background: Constant.greyColor,
            imageName: Constant.lightRoastImage,
            title: Constant.lightRoastType
        )
        button.addTarget(self, action: #selector(tapTypeButton(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var darkRoastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 195,
            valueY: 102,
            width: 165,
            height: 165,
            background: Constant.greyColor,
            imageName: Constant.darkRoastImage,
            title: Constant.darkRoastType
        )
        button.addTarget(self, action: #selector(tapTypeButton(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 26,
            width: 14,
            height: 14
        ))
        button.setImage(UIImage(named: Constant.cancel), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupSubview()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubviews(lightRoastTypeButton, darkRoastTypeButton, cancelButton, titleLabel)
    }

    @objc private func tapTypeButton(_ sender: UIButton) {
        if sender == lightRoastTypeButton {
            guard let text = lightRoastTypeButton.titleLabel?.text else { return }
            delegate?.modalViewControllerDidDismiss(roastType: text, roastImage: Constant.lightRoastImage)
            dismiss(animated: true)
        } else {
            guard let text = darkRoastTypeButton.titleLabel?.text else { return }
            delegate?.modalViewControllerDidDismiss(roastType: text, roastImage: Constant.darkRoastImage)
            dismiss(animated: true)
        }
    }

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }
}
