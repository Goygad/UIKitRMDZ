// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с историями
final class StoriesCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let myStory = "Ваша история"
        static let lavandaStory = "lavanda123"
    }

    static let identifier = "StoriesCell"

    // MARK: - Private properties

    private let scrollView = UIScrollView()
    private let myStory = UIImageView()
    private let imageStories = UIImageView()
    private let imageStoriesTwo = UIImageView()
    private let imageStoriesThree = UIImageView()
    private let imageStoriesFour = UIImageView()
    private let imageStoriesFive = UIImageView()
    private let myStoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = Constants.myStory
        return label
    }()

    private let lavandaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = Constants.lavandaStory
        return label
    }()

    private let lavandaLabelTwo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = Constants.lavandaStory
        return label
    }()

    private let lavandaLabelThree: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = Constants.lavandaStory
        return label
    }()

    private let lavandaLabelFour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = Constants.lavandaStory
        return label
    }()

    private let lavandaLabelFive: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = Constants.lavandaStory
        return label
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
        scrollView.showsHorizontalScrollIndicator = false
        contentView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        scrollView.layer.borderColor = .none
        contentView.addSubview(scrollView)
        scrollView.addSubview(myStory)
        scrollView.addSubview(imageStories)
        scrollView.addSubview(imageStoriesTwo)
        scrollView.addSubview(imageStoriesThree)
        scrollView.addSubview(imageStoriesFour)
        scrollView.addSubview(imageStoriesFive)
        scrollView.addSubview(myStoryLabel)
        scrollView.addSubview(lavandaLabel)
        scrollView.addSubview(lavandaLabelTwo)
        scrollView.addSubview(lavandaLabelThree)
        scrollView.addSubview(lavandaLabelFour)
        scrollView.addSubview(lavandaLabelFive)
        makeScrollViewConstraints()
        makeMyStoryViewConstraints()
        makeImageViewConstraints()
        makeImageView2Constraints()
        makeImageView3Constraints()
        makeImageView4Constraints()
        makeImageView5Constraints()
        makeMyStoryLabelConstraints()
        makeLavandaLabelConstraints()
        makeLavandaLabelTwoConstraints()
        makeLavandaLabelThreeConstraints()
        makeLavandaLabelFourConstraints()
        makeLavandaLabelFiveConstraints()
    }

    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func makeMyStoryViewConstraints() {
        myStory.translatesAutoresizingMaskIntoConstraints = false
        myStory.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myStory.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myStory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        myStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        myStory.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func makeImageViewConstraints() {
        imageStories.translatesAutoresizingMaskIntoConstraints = false
        imageStories.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories.leadingAnchor.constraint(equalTo: myStory.trailingAnchor, constant: 22).isActive = true
        imageStories.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageView2Constraints() {
        imageStoriesTwo.translatesAutoresizingMaskIntoConstraints = false
        imageStoriesTwo.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesTwo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesTwo.leadingAnchor.constraint(equalTo: imageStories.trailingAnchor, constant: 22).isActive = true
        imageStoriesTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageView3Constraints() {
        imageStoriesThree.translatesAutoresizingMaskIntoConstraints = false
        imageStoriesThree.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesThree.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesThree.leadingAnchor.constraint(equalTo: imageStoriesTwo.trailingAnchor, constant: 22)
            .isActive = true
        imageStoriesThree.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageView4Constraints() {
        imageStoriesFour.translatesAutoresizingMaskIntoConstraints = false
        imageStoriesFour.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesFour.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesFour.leadingAnchor.constraint(equalTo: imageStoriesThree.trailingAnchor, constant: 22)
            .isActive = true
        imageStoriesFour.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageView5Constraints() {
        imageStoriesFive.translatesAutoresizingMaskIntoConstraints = false
        imageStoriesFive.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesFive.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStoriesFive.leadingAnchor.constraint(equalTo: imageStoriesFour.trailingAnchor, constant: 22)
            .isActive = true
        imageStoriesFive.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        imageStoriesFive.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeMyStoryLabelConstraints() {
        myStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        myStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        myStoryLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        myStoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        myStoryLabel.topAnchor.constraint(equalTo: myStory.bottomAnchor, constant: 5).isActive = true
    }

    private func makeLavandaLabelConstraints() {
        lavandaLabel.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabel.leadingAnchor.constraint(equalTo: myStoryLabel.trailingAnchor, constant: 8).isActive = true
        lavandaLabel.topAnchor.constraint(equalTo: imageStories.bottomAnchor, constant: 5).isActive = true
    }

    private func makeLavandaLabelTwoConstraints() {
        lavandaLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelTwo.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelTwo.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelTwo.leadingAnchor.constraint(equalTo: lavandaLabel.trailingAnchor, constant: 8).isActive = true
        lavandaLabelTwo.topAnchor.constraint(equalTo: imageStoriesTwo.bottomAnchor, constant: 5).isActive = true
    }

    private func makeLavandaLabelThreeConstraints() {
        lavandaLabelThree.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelThree.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelThree.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelThree.leadingAnchor.constraint(equalTo: lavandaLabelTwo.trailingAnchor, constant: 8).isActive = true
        lavandaLabelThree.topAnchor.constraint(equalTo: imageStoriesThree.bottomAnchor, constant: 5).isActive = true
    }

    private func makeLavandaLabelFourConstraints() {
        lavandaLabelFour.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelFour.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelFour.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelFour.leadingAnchor.constraint(equalTo: lavandaLabelThree.trailingAnchor, constant: 8)
            .isActive = true
        lavandaLabelFour.topAnchor.constraint(equalTo: imageStoriesFour.bottomAnchor, constant: 5).isActive = true
    }

    private func makeLavandaLabelFiveConstraints() {
        lavandaLabelFive.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelFive.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelFive.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelFive.leadingAnchor.constraint(equalTo: lavandaLabelFour.trailingAnchor, constant: 8).isActive = true
        lavandaLabelFive.topAnchor.constraint(equalTo: imageStoriesFive.bottomAnchor, constant: 5).isActive = true
    }

    // MARK: - Methods

    func setupCell(stories: [String]) {
        myStory.image = UIImage(named: stories[0])
        imageStories.image = UIImage(named: stories[1])
        imageStoriesTwo.image = UIImage(named: stories[1])
        imageStoriesThree.image = UIImage(named: stories[1])
        imageStoriesFour.image = UIImage(named: stories[1])
        imageStoriesFive.image = UIImage(named: stories[1])
    }
}
