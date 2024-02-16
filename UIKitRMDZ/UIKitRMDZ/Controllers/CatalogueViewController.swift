// CatalogueViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CatalogueViewController: UIViewController {
    // MARK: - Constants

    private enum Constant {
        static let black = "2250₽"
        static let blackShoes = "4250₽"
        static let red = "5750₽"
        static let yellow = "3500₽"
        static let white = "5750₽"
        static let shoes = "Обувь"
    }

    // MARK: - Visual

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    private let blackImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womShoesBlack
        return image
    }()

    private let blackShoesView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    private let blackShoesImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womShoesCatalogBlack
        return image
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    private let redImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womShoesCatalogRed
        return image
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    private let yellowImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womShoesCatalogYellow
        return image
    }()

    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .backView
        view.layer.cornerRadius = 20
        return view
    }()

    private let whiteImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womShoesCatalogWhite
        return image
    }()

    private let blackLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.black
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    private let blackShoesLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.blackShoes
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    private let redLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.red
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    private let yellowLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.yellow
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    private let whiteLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.white
        label.textColor = .black
        label.font = .systemFont(ofSize: 10, weight: .heavy)
        label.textAlignment = .right
        return label
    }()

    private lazy var blackButton: UIButton = {
        let button = UIButton()
        button.setImage(.outCart, for: .normal)
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return button
    }()

    private lazy var blackShoesButton: UIButton = {
        let button = UIButton()
        button.setImage(.outCart, for: .normal)
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return button
    }()

    private lazy var redButton: UIButton = {
        let button = UIButton()
        button.setImage(.outCart, for: .normal)

        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)

        return button
    }()

    private lazy var yellowButton: UIButton = {
        let button = UIButton()
        button.setImage(.outCart, for: .normal)
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return button
    }()

    private lazy var whiteButton: UIButton = {
        let button = UIButton()
        button.setImage(.outCart, for: .normal)
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    // MARK: - Private methods

    private func setupViewController() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: .backItem.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )
        navigationItem.title = Constant.shoes

        view.backgroundColor = .white
        view.addSubview(blackView)
        view.addSubview(blackShoesView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(whiteView)

        blackView.addSubview(blackImageView)
        blackShoesView.addSubview(blackShoesImageView)
        redView.addSubview(redImageView)
        yellowView.addSubview(yellowImageView)
        whiteView.addSubview(whiteImageView)

        blackView.addSubview(blackButton)
        blackShoesView.addSubview(blackShoesButton)
        redView.addSubview(redButton)
        yellowView.addSubview(yellowButton)
        whiteView.addSubview(whiteButton)

        blackView.addSubview(blackLabel)
        blackShoesView.addSubview(blackShoesLabel)
        redView.addSubview(redLabel)
        yellowView.addSubview(yellowLabel)
        whiteView.addSubview(whiteLabel)

        makeBlackViewConstraints()
        makeBlackShoesViewConstraints()
        makeRedViewConstraints()
        makeYellowViewConstraints()
        makeWhiteViewConstraints()
        makeBlackImageConstraints()
        makeBlackShoesImageConstraints()
        makeRedImageConstraints()
        makeYellowImageConstraints()
        makeWhiteImageConstraints()
        makeBlackButtonConstraints()
        makeBlackShoesButtonConstraints()
        makeRedButtonConstraints()
        makeYellowButtonConstraints()
        makeWhiteButtonConstraints()
        makeBlackLabelConstraints()
        makeBlackShoesLabelConstraints()
        makeRedLabelConstraints()
        makeYellowLabelConstraints()
        makeWhiteLabelConstraints()
    }

    private func makeBlackViewConstraints() {
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        blackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -198).isActive = true
        blackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makeBlackShoesViewConstraints() {
        blackShoesView.translatesAutoresizingMaskIntoConstraints = false
        blackShoesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 198).isActive = true
        blackShoesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        blackShoesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        blackShoesView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        blackShoesView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makeRedViewConstraints() {
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -198).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 303).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makeYellowViewConstraints() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 198).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 303).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makeWhiteViewConstraints() {
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -198).isActive = true
        whiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 476).isActive = true
        whiteView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 157).isActive = true
    }

    private func makeBlackImageConstraints() {
        blackImageView.translatesAutoresizingMaskIntoConstraints = false
        blackImageView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 29).isActive = true
        blackImageView.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 28).isActive = true
        blackImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blackImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeBlackShoesImageConstraints() {
        blackShoesImageView.translatesAutoresizingMaskIntoConstraints = false
        blackShoesImageView.leadingAnchor.constraint(equalTo: blackShoesView.leadingAnchor, constant: 29)
            .isActive = true
        blackShoesImageView.topAnchor.constraint(equalTo: blackShoesView.topAnchor, constant: 28).isActive = true
        blackShoesImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blackShoesImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeRedImageConstraints() {
        redImageView.translatesAutoresizingMaskIntoConstraints = false
        redImageView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 29).isActive = true
        redImageView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 28).isActive = true
        redImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeYellowImageConstraints() {
        yellowImageView.translatesAutoresizingMaskIntoConstraints = false
        yellowImageView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: 29).isActive = true
        yellowImageView.topAnchor.constraint(equalTo: yellowView.topAnchor, constant: 28).isActive = true
        yellowImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        yellowImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeWhiteImageConstraints() {
        whiteImageView.translatesAutoresizingMaskIntoConstraints = false
        whiteImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 29).isActive = true
        whiteImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 28).isActive = true
        whiteImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        whiteImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func makeBlackButtonConstraints() {
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 126).isActive = true
        blackButton.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 11).isActive = true
        blackButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        blackButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeBlackShoesButtonConstraints() {
        blackShoesButton.translatesAutoresizingMaskIntoConstraints = false
        blackShoesButton.leadingAnchor.constraint(equalTo: blackShoesView.leadingAnchor, constant: 126).isActive = true
        blackShoesButton.topAnchor.constraint(equalTo: blackShoesView.topAnchor, constant: 11).isActive = true
        blackShoesButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        blackShoesButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeRedButtonConstraints() {
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 126).isActive = true
        redButton.topAnchor.constraint(equalTo: redView.topAnchor, constant: 11).isActive = true
        redButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        redButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeYellowButtonConstraints() {
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: 126).isActive = true
        yellowButton.topAnchor.constraint(equalTo: yellowView.topAnchor, constant: 11).isActive = true
        yellowButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        yellowButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeWhiteButtonConstraints() {
        whiteButton.translatesAutoresizingMaskIntoConstraints = false
        whiteButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 126).isActive = true
        whiteButton.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 11).isActive = true
        whiteButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        whiteButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeBlackLabelConstraints() {
        blackLabel.translatesAutoresizingMaskIntoConstraints = false
        blackLabel.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 85).isActive = true
        blackLabel.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 133).isActive = true
        blackLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        blackLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeBlackShoesLabelConstraints() {
        blackShoesLabel.translatesAutoresizingMaskIntoConstraints = false
        blackShoesLabel.leadingAnchor.constraint(equalTo: blackShoesView.leadingAnchor, constant: 85).isActive = true
        blackShoesLabel.topAnchor.constraint(equalTo: blackShoesView.topAnchor, constant: 133).isActive = true
        blackShoesLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        blackShoesLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeRedLabelConstraints() {
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 85).isActive = true
        redLabel.topAnchor.constraint(equalTo: redView.topAnchor, constant: 133).isActive = true
        redLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        redLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeYellowLabelConstraints() {
        yellowLabel.translatesAutoresizingMaskIntoConstraints = false
        yellowLabel.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: 85).isActive = true
        yellowLabel.topAnchor.constraint(equalTo: yellowView.topAnchor, constant: 133).isActive = true
        yellowLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        yellowLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeWhiteLabelConstraints() {
        whiteLabel.translatesAutoresizingMaskIntoConstraints = false
        whiteLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 85).isActive = true
        whiteLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 133).isActive = true
        whiteLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        whiteLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    @objc private func addToCart(button: UIButton) {
        button.setImage(.inCart, for: .normal)
        let sizeVC = SizeViewController()
        present(UINavigationController(rootViewController: sizeVC), animated: true, completion: nil)
    }
}
