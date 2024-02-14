// GratitudeController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс с благодарностью

final class GratitudeController: UIViewController {
    // MARK: - Constants
    private enum ConstantStrings: String {
        case good = "Хорошо"
        
    }
    // MARK: - Visual

    private let graphicPatternImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 92, y: 58, width: 200, height: 86)
        image.image = UIImage(named: "imageGratitudeVC")
        return image
    }()

    private let gratitudeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 75, y: 184, width: 235, height: 128)
        image.image = UIImage(named: "thanks")
        return image
    }()

    private let promoLabel: UILabel = {
        let label = UILabel()
        label.text =
            """
            Разскажи о насъ другу, отправь ему промокодъ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
            """
        label.frame = CGRect(x: 30, y: 362, width: 315, height: 89)
        label.font = UIFont(name: "Verdana", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private lazy var goodButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 632, width: 335, height: 44)
        button.setTitle(ConstantStrings.good.rawValue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(named: "newButtonColor")
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(popToRootViewController), for: .touchUpInside)
        return button
    }()

    private let loginButtonImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 2, width: 45, height: 45)
        image.image = UIImage(named: "bean")
        return image
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(graphicPatternImageView)
        view.addSubview(gratitudeImageView)
        view.addSubview(promoLabel)
        view.addSubview(goodButton)
        goodButton.addSubview(loginButtonImage)
    }

    @objc private func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
}
