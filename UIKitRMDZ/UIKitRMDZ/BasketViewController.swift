// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let basket = "Корзина"
    static let fontVerdana = "Verdana-Bold"
    static let full = "Ваша корзина пуста"
    static let basketImage = "basketImage"
    static let recommended = "Перейдите в каталог и добавьте товары в корзину"
}

///
final class BasketViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.basket
        label.font = UIFont(name: Constant.fontVerdana, size: 16)
        return label
    }()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.full
        label.font = UIFont(name: Constant.fontVerdana, size: 16)
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.basketImage)
        return imageView
    }()

    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.recommended
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        initSubviews()
    }

    // MARK: - Private Methods

    private func initSubviews() {
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: Constant.basket, image: UIImage(systemName: "basket.fill"), tag: 1)
    }

    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(infoLabel)
        view.addSubview(imageView)
        view.addSubview(recommendLabel)
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        recommendLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),

            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 250),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 153),
            imageView.heightAnchor.constraint(equalToConstant: 73),
            imageView.widthAnchor.constraint(equalToConstant: 73),

            infoLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            infoLabel.heightAnchor.constraint(equalToConstant: 44),

            recommendLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 8),
            recommendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            recommendLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            recommendLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
