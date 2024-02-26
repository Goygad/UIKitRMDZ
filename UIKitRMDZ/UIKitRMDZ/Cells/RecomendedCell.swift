// RecomendedCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Рекомендации вам
final class RecomendedCell: UITableViewCell {
    // MARK: - Constants

    enum Constant {
        static let recomend = "Рекомендуем вам"
        static let allButton = "Все"
        static let subsButton = "Подписаться"
    }

    static let identifier = "RecomendedCell"

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let recomendForYouLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.recomend
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()

    private let allButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(Constant.allButton, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .right
        return button
    }()

    private let xCrimeaButton: UIButton = {
        let button = UIButton()
        button.setImage(.xButton, for: .normal)
        return button
    }()

    private let xMaryButton: UIButton = {
        let button = UIButton()
        button.setImage(.xButton, for: .normal)
        return button
    }()

    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainView
        return view
    }()

    private let accountViewCrimea: UIView = {
        let view = UIImageView()
        view.backgroundColor = .white
        return view
    }()

    private let accountViewMary: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let avatarImageViewCrimea: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let avatarImageViewMary: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let crimeaNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private let maryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private let subscribeCrimeaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle(Constant.subsButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return button
    }()

    private let subscribeMaryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle(Constant.subsButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return button
    }()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI() {
        contentView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        contentView.addSubview(mainView)
        mainView.addSubview(scrollView)
        mainView.addSubview(recomendForYouLabel)
        mainView.addSubview(allButton)
        scrollView.addSubview(accountViewCrimea)
        scrollView.addSubview(accountViewMary)
        accountViewCrimea.addSubview(xCrimeaButton)
        accountViewCrimea.addSubview(avatarImageViewCrimea)
        accountViewCrimea.addSubview(crimeaNameLabel)
        accountViewCrimea.addSubview(subscribeCrimeaButton)
        accountViewMary.addSubview(xMaryButton)
        accountViewMary.addSubview(avatarImageViewMary)
        accountViewMary.addSubview(maryNameLabel)
        accountViewMary.addSubview(subscribeMaryButton)
        makeMainViewConstraints()
        makeScrollViewConstraints()
        makeRecomendLabelConstraints()
        makeAllButtonConstraints()
        makeAccountViewCrimeaConstraints()
        makeXCrimeaButtonConstraints()
        makeAvatarImageViewCrimeaConstraints()
        makeCrimeaNameLabelConstraints()
        makeSubscribeCrimeaButtonConstraints()
        makeAccountViewMaryConstraints()
        makeXMaryButtonConstraints()
        makeXMaryButtonConstraints()
        makeAvatarImageViewMaryConstraints()
        makeMaryNameLabelConstraints()
        makeSubscribeMaryButtonConstraints()
    }

    private func makeMainViewConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45).isActive = true
    }

    private func makeRecomendLabelConstraints() {
        recomendForYouLabel.translatesAutoresizingMaskIntoConstraints = false
        recomendForYouLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12)
            .isActive = true
        recomendForYouLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 9).isActive = true
        recomendForYouLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        recomendForYouLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func makeAllButtonConstraints() {
        allButton.translatesAutoresizingMaskIntoConstraints = false
        allButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10)
            .isActive = true
        allButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 9).isActive = true
        allButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        allButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func makeAccountViewCrimeaConstraints() {
        accountViewCrimea.translatesAutoresizingMaskIntoConstraints = false
        accountViewCrimea.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17)
            .isActive = true
        accountViewCrimea.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        accountViewCrimea.widthAnchor.constraint(equalToConstant: 185).isActive = true
        accountViewCrimea.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func makeAccountViewMaryConstraints() {
        accountViewMary.translatesAutoresizingMaskIntoConstraints = false
        accountViewMary.leadingAnchor.constraint(equalTo: accountViewCrimea.trailingAnchor, constant: 20)
            .isActive = true
        accountViewMary.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -17)
            .isActive = true
        accountViewMary.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        accountViewMary.widthAnchor.constraint(equalToConstant: 185).isActive = true
        accountViewMary.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func makeXCrimeaButtonConstraints() {
        xCrimeaButton.translatesAutoresizingMaskIntoConstraints = false
        xCrimeaButton.trailingAnchor.constraint(equalTo: accountViewCrimea.trailingAnchor, constant: -8)
            .isActive = true
        xCrimeaButton.topAnchor.constraint(equalTo: accountViewCrimea.topAnchor, constant: 8).isActive = true
        xCrimeaButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        xCrimeaButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }

    private func makeXMaryButtonConstraints() {
        xMaryButton.translatesAutoresizingMaskIntoConstraints = false
        xMaryButton.trailingAnchor.constraint(equalTo: accountViewMary.trailingAnchor, constant: -8)
            .isActive = true
        xMaryButton.topAnchor.constraint(equalTo: accountViewMary.topAnchor, constant: 8).isActive = true
        xMaryButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        xMaryButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }

    private func makeAvatarImageViewCrimeaConstraints() {
        avatarImageViewCrimea.translatesAutoresizingMaskIntoConstraints = false
        avatarImageViewCrimea.leadingAnchor.constraint(equalTo: accountViewCrimea.leadingAnchor, constant: 35)
            .isActive = true
        avatarImageViewCrimea.topAnchor.constraint(equalTo: accountViewCrimea.topAnchor, constant: 15).isActive = true
        avatarImageViewCrimea.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageViewCrimea.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func makeAvatarImageViewMaryConstraints() {
        avatarImageViewMary.translatesAutoresizingMaskIntoConstraints = false
        avatarImageViewMary.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 35)
            .isActive = true
        avatarImageViewMary.topAnchor.constraint(equalTo: accountViewMary.topAnchor, constant: 15).isActive = true
        avatarImageViewMary.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageViewMary.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func makeCrimeaNameLabelConstraints() {
        crimeaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        crimeaNameLabel.leadingAnchor.constraint(equalTo: accountViewCrimea.leadingAnchor, constant: 42)
            .isActive = true
        crimeaNameLabel.topAnchor.constraint(equalTo: avatarImageViewCrimea.bottomAnchor, constant: 5).isActive = true
        crimeaNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        crimeaNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeMaryNameLabelConstraints() {
        maryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        maryNameLabel.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 42)
            .isActive = true
        maryNameLabel.topAnchor.constraint(equalTo: avatarImageViewMary.bottomAnchor, constant: 5).isActive = true
        maryNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        maryNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeSubscribeCrimeaButtonConstraints() {
        subscribeCrimeaButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeCrimeaButton.leadingAnchor.constraint(equalTo: accountViewCrimea.leadingAnchor, constant: 10)
            .isActive = true
        subscribeCrimeaButton.bottomAnchor.constraint(equalTo: accountViewCrimea.bottomAnchor, constant: -9)
            .isActive = true
        subscribeCrimeaButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeCrimeaButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makeSubscribeMaryButtonConstraints() {
        subscribeMaryButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeMaryButton.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 10)
            .isActive = true
        subscribeMaryButton.bottomAnchor.constraint(equalTo: accountViewMary.bottomAnchor, constant: -9)
            .isActive = true
        subscribeMaryButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeMaryButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // MARK: - Methods

    func setupRec(recomend: RecomendedAccaounts) {
        avatarImageViewCrimea.image = UIImage(named: recomend.avatarImageName[0])
        avatarImageViewMary.image = UIImage(named: recomend.avatarImageName[1])
        crimeaNameLabel.text = recomend.nameAccount[0]
        maryNameLabel.text = recomend.nameAccount[1]
    }
}
