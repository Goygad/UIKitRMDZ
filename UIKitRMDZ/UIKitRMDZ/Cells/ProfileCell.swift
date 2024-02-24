// ProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с информацией профиля
final class ProfileCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "ProfileCell"

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let postCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .left
        return label
    }()

    private let subscribersCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .left
        return label
    }()

    private let subscriptionsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private let subscriptionsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .left
        return label
    }()

    private let profileNamelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .bold)
        return label
    }()

    private let professionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        return label
    }()

    private let changeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        return label
    }()

    private let shareLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        return label
    }()

    private let iconPeopleImageView: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
//        imageView.clipsToBounds = true
        button.backgroundColor = .systemGray4
        return button
    }()

    private let buttonSite: UIButton = {
        let button = UIButton()
        button.setTitle("www.spacex.com", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.textAlignment = .left
        return button
    }()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        contentView.addSubview(postCountLabel)
        contentView.addSubview(postLabel)
        contentView.addSubview(subscribersCountLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(subscriptionsCountLabel)
        contentView.addSubview(subscriptionsLabel)
        contentView.addSubview(profileNamelLabel)
        contentView.addSubview(professionLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(shareLabel)
        contentView.addSubview(iconPeopleImageView)
        contentView.addSubview(buttonSite)
        makeAvatarImageViewConstraints()
        makePostCountLabelConstraints()
        makePostLabelConstraints()
        makeSubscribersCountLabelConstraints()
        makeSubscribersLabelConstraints()
        makeSubscriptionsCountLabelConstraints()
        makeSubscriptionsLabelConstraints()
        makenameProfielLabelConstraints()
        makeProfessionLabelConstraints()
        makeChangeLabelConstraints()
        makeSharelLabelConstraints()
        makeiconPeopleViewConstraints()
        makeButtonSiteConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setUp(profileInfo: ProfileInfo) {
        avatarImageView.image = UIImage(named: profileInfo.avatarImage)
        postCountLabel.text = profileInfo.countPhoto
        postLabel.text = profileInfo.countPhotoLabel
        subscribersCountLabel.text = profileInfo.countSubscribers
        subscribersLabel.text = profileInfo.countSubscribersLabel
        subscriptionsCountLabel.text = profileInfo.countSubscriptions
        subscriptionsLabel.text = profileInfo.countSubscriptionsLabel
        profileNamelLabel.text = profileInfo.nameProfiel
        professionLabel.text = profileInfo.proffesionProfiel
        changeLabel.text = profileInfo.changeProfiel
        shareLabel.text = profileInfo.shareProfiel
        iconPeopleImageView.setImage(UIImage(named: profileInfo.iconPeople), for: .normal)
        buttonSite.setTitle("www.spacex.com", for: .normal)
    }

    // MARK: - Private methods

    private func makeAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func makePostCountLabelConstraints() {
        postCountLabel.translatesAutoresizingMaskIntoConstraints = false
        postCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 155).isActive = true
        postCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        postCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        postCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makePostLabelConstraints() {
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130).isActive = true
        postLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeSubscribersCountLabelConstraints() {
        subscribersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 225)
            .isActive = true
        subscribersCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscribersCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribersCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeSubscribersLabelConstraints() {
        subscribersLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 208).isActive = true
        subscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscribersLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeSubscriptionsCountLabelConstraints() {
        subscriptionsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 291)
            .isActive = true
        subscriptionsCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscriptionsCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscriptionsCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeSubscriptionsLabelConstraints() {
        subscriptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 282).isActive = true
        subscriptionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscriptionsLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makenameProfielLabelConstraints() {
        profileNamelLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNamelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        profileNamelLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 95).isActive = true
        profileNamelLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        profileNamelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeProfessionLabelConstraints() {
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        professionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 115).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        professionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeChangeLabelConstraints() {
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        changeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func makeSharelLabelConstraints() {
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        shareLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175).isActive = true
        shareLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        shareLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func makeiconPeopleViewConstraints() {
        iconPeopleImageView.translatesAutoresizingMaskIntoConstraints = false
        iconPeopleImageView.leadingAnchor.constraint(equalTo: shareLabel.trailingAnchor, constant: 5).isActive = true
//        iconPeopleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 190).isActive = true
        iconPeopleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        iconPeopleImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        iconPeopleImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    private func makeButtonSiteConstraints() {
        buttonSite.translatesAutoresizingMaskIntoConstraints = false
        buttonSite.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        buttonSite.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140).isActive = true
        buttonSite.widthAnchor.constraint(equalToConstant: 130).isActive = true
        buttonSite.heightAnchor.constraint(equalToConstant: 30).isActive = true

        buttonSite.addTarget(self, action: #selector(siteButtonTapped), for: .touchUpInside)
    }

    @objc private func siteButtonTapped() {
        if let url = URL(string: "https://www.spacex.com/vehicles/starship/") {
            UIApplication.shared.open(url)
        }
    }
}
