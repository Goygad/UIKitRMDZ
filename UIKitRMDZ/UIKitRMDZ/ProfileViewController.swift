// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let profile = "Профиль"
    static let userData = "Личные данные"
    static let cardImage = "card"
    static let fontVerdana = "Verdana-Bold"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
    static let myData = "Мои данные"
    static let bringFriend = "Приведи друга"
    static let feedBack = "Обратная связь"
}

/// Данный класс создает меню профиля пользователя
final class ProfileViewController: UIViewController {
    var userInfoModel = UserInfoModel(
        name: "Mouse",
        surname: "Mickey",
        phone: 89_886_666_666,
        sizeLeg: 45,
        birthday: Date(),
        email: "mmm.@mail.ru"
    )

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.profile
        label.font = UIFont(name: Constant.fontVerdana, size: 16)
        return label
    }()

    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.cardImage)
        return imageView
    }()

    private let userDataLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.userData
        label.font = UIFont(name: Constant.fontVerdana, size: 16)
        return label
    }()

    private lazy var userInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.myData, for: .normal)
        button.setImage(UIImage(named: Constant.userDataImage), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontVerdana, size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 240)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 260)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapUserInfoButton), for: .touchUpInside)
        return button
    }()

    private let bringFriendButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.bringFriend, for: .normal)
        button.setImage(UIImage(named: Constant.shareImage), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontVerdana, size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 220)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 240)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.feedBack, for: .normal)
        button.setImage(UIImage(named: Constant.feedbackImage), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.fontVerdana, size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 220)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 240)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        initSubviews()
    }

    // MARK: - Private Methods

    private func initSubviews() {
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: Constant.profile, image: UIImage(systemName: "person.fill"), tag: 2)
    }

    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(cardImageView)
        view.addSubview(userDataLabel)
        view.addSubview(userInfoButton)
        view.addSubview(bringFriendButton)
        view.addSubview(feedbackButton)
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        userDataLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoButton.translatesAutoresizingMaskIntoConstraints = false
        bringFriendButton.translatesAutoresizingMaskIntoConstraints = false
        feedbackButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 130),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),

            cardImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
            cardImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardImageView.heightAnchor.constraint(equalToConstant: 180),

            userDataLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 20),
            userDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            userDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 23),
            userDataLabel.heightAnchor.constraint(equalToConstant: 44),

            userInfoButton.topAnchor.constraint(equalTo: userDataLabel.bottomAnchor, constant: 20),
            userInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            userInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 23),
            userInfoButton.heightAnchor.constraint(equalToConstant: 44),

            bringFriendButton.topAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: 20),
            bringFriendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            bringFriendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 23),
            bringFriendButton.heightAnchor.constraint(equalToConstant: 44),

            feedbackButton.topAnchor.constraint(equalTo: bringFriendButton.bottomAnchor, constant: 20),
            feedbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            feedbackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 23),
            feedbackButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func tapUserInfoButton() {
        let userInfoViewController = UserInfoViewController()
        userInfoViewController.delegate = self
        userInfoViewController.configure(model: userInfoModel)
        navigationController?.pushViewController(userInfoViewController, animated: true)
    }
}

extension ProfileViewController: UserInfoViewControllerDelegate {
    func tapSaveButton(model: UserInfoModel) {
        userInfoModel = model
    }
}
