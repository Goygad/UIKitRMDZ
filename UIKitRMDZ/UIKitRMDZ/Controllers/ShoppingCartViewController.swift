// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ShoppingCartViewController: UIViewController {
    // MARK: - Constants

    private enum Constant {
        static let button = "Оформить заказ"
        static let cart = "Корзина"
    }

    private enum ConstantSize {
        static let size = "Выберите размер"
        static let size35 = "35"
        static let size36 = "36"
        static let size37 = "37"
        static let size38 = "38"
        static let size39 = "39"
    }

    // MARK: - Visual

    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constant.button, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .selectedBar
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.5
        return button
    }()

    private let size35Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ConstantSize.size35, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightPink
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 13
        return button
    }()

    private let size38Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ConstantSize.size38, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightPink
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 20
        return button
    }()

    private let size36Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ConstantSize.size36, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightPink
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 20
        return button
    }()

    private let size37Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ConstantSize.size37, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightPink
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 20
        return button
    }()

    private let size39Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(ConstantSize.size39, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightPink
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        button.layer.cornerRadius = 20
        return button
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    let chosenProductView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    lazy var chosenProductImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        saveToCart()
    }

    // MARK: - Private methods

    func setupTabBar() {
        view.backgroundColor = .white
        navigationItem.title = Constant.cart
        view.addSubview(chosenProductView)
        view.addSubview(chosenProductImageView)
        view.addSubview(priceLabel)
        view.addSubview(orderButton)
        view.addSubview(size35Button)
        view.addSubview(size36Button)
        view.addSubview(size37Button)
        view.addSubview(size38Button)
        view.addSubview(size39Button)

        makeChosenProductViewConstraints()
        makechosenProductImageViewConstraints()
        makeOrderButton()
        makeSize35ButtonConstraints()
        makePriceLabelConstraints()
        setupSizeButtons()
    }

    private func saveToCart() {
        ShoesDataStorage.storage.read().forEach { [weak self] in
            self?.chosenProductImageView.image = UIImage(named: $0.image.rawValue)
            self?.priceLabel.text = $0.price
            self?.view.layoutIfNeeded()
        }
    }

    private func makeChosenProductViewConstraints() {
        chosenProductView.translatesAutoresizingMaskIntoConstraints = false
        chosenProductView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        chosenProductView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -198).isActive = true
        chosenProductView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        chosenProductView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        chosenProductView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makechosenProductImageViewConstraints() {
        chosenProductImageView.translatesAutoresizingMaskIntoConstraints = false
        chosenProductImageView.leadingAnchor.constraint(equalTo: chosenProductView.leadingAnchor, constant: 29)
            .isActive = true
        chosenProductImageView.topAnchor.constraint(equalTo: chosenProductView.topAnchor, constant: 28).isActive = true
        chosenProductImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        chosenProductImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeSize35ButtonConstraints() {
        size35Button.translatesAutoresizingMaskIntoConstraints = false
        size35Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 199).isActive = true
        size35Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 213).isActive = true
        size35Button.widthAnchor.constraint(equalToConstant: 31).isActive = true
    }

    private func makePriceLabelConstraints() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.leadingAnchor.constraint(equalTo: chosenProductView.leadingAnchor, constant: 85).isActive = true
        priceLabel.topAnchor.constraint(equalTo: chosenProductView.topAnchor, constant: 133).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeOrderButton() {
        view.addSubview(orderButton)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        orderButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114).isActive = true
        orderButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
    }

    private func setupSizeButtons() {
        let buttons = [size36Button, size37Button, size38Button, size39Button]
        var left = 234
        for button in buttons {
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(left)).isActive = true
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 213).isActive = true
            button.widthAnchor.constraint(equalToConstant: 31).isActive = true

            left += 35
        }
    }
}
