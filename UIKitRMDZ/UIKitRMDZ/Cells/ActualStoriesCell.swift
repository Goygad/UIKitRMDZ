// ActualStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Актуальные истории
class ActualStoriesCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "ActualStoriesCell"

    // MARK: - Visual Components

    let scrollView = UIScrollView()
    let actualFirst = UIButton(type: .custom)
    let actualTwo = UIImageView()
    let actualThree = UIImageView()
    let actualFour = UIImageView()
    let actualFive = UIImageView()
    let actualSix = UIImageView()
    let actualSeven = UIImageView()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        scrollView.addSubview(actualFirst)
        scrollView.addSubview(actualTwo)
        scrollView.addSubview(actualThree)
        scrollView.addSubview(actualFour)
        scrollView.addSubview(actualFive)
        scrollView.addSubview(actualSix)
        scrollView.addSubview(actualSeven)
        makeScrollViewConstraints()
        makeActualStoriesConstraints()
        makeActualTwoStoriesConstraints()
        makeActualTreeStoriesConstraints()
        makeActualFourStoriesConstraints()
        makeActualFiveStoriesConstraints()
        makeActualSixStoriesConstraints()
        makeActualSevenStoriesConstraints()
    }

    // MARK: - Private methods

    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func makeActualStoriesConstraints() {
        actualFirst.translatesAutoresizingMaskIntoConstraints = false
        actualFirst.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        actualFirst.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualFirst.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualFirst.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualTwoStoriesConstraints() {
        actualTwo.translatesAutoresizingMaskIntoConstraints = false
        actualTwo.leadingAnchor.constraint(equalTo: actualFirst.trailingAnchor, constant: 10)
            .isActive = true
        actualTwo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualTwo.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualTwo.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualTreeStoriesConstraints() {
        actualThree.translatesAutoresizingMaskIntoConstraints = false
        actualThree.leadingAnchor.constraint(equalTo: actualTwo.leadingAnchor, constant: 62).isActive = true
        actualThree.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualThree.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualThree.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualFourStoriesConstraints() {
        actualFour.translatesAutoresizingMaskIntoConstraints = false
        actualFour.leadingAnchor.constraint(equalTo: actualThree.leadingAnchor, constant: 62).isActive = true
        actualFour.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualFour.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualFour.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualFiveStoriesConstraints() {
        actualFive.translatesAutoresizingMaskIntoConstraints = false
        actualFive.leadingAnchor.constraint(equalTo: actualFour.leadingAnchor, constant: 62).isActive = true
        actualFive.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualFive.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualFive.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualSixStoriesConstraints() {
        actualSix.translatesAutoresizingMaskIntoConstraints = false
        actualSix.leadingAnchor.constraint(equalTo: actualFive.leadingAnchor, constant: 62).isActive = true
        actualSix.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualSix.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualSix.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    private func makeActualSevenStoriesConstraints() {
        actualSeven.translatesAutoresizingMaskIntoConstraints = false
        actualSeven.leadingAnchor.constraint(equalTo: actualSix.leadingAnchor, constant: 62).isActive = true
        actualSeven.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        actualSeven.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        actualSeven.widthAnchor.constraint(equalToConstant: 55).isActive = true
        actualSeven.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    func setUpCell(actualStory: [String]) {
        actualFirst.setImage(UIImage(named: actualStory[0]), for: .normal)
        actualTwo.image = UIImage(named: actualStory[1])
        actualThree.image = UIImage(named: actualStory[2])
        actualFour.image = UIImage(named: actualStory[3])
        actualFive.image = UIImage(named: actualStory[0])
        actualSix.image = UIImage(named: actualStory[1])
        actualSeven.image = UIImage(named: actualStory[2])
    }
}
