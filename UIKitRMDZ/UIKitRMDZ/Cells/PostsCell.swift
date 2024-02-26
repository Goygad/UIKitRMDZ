// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка на которой отображаются посление публикации
final class PostsCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "PostsCell"

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    private let pointsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .points
        imageView.contentMode = .center
        return imageView
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let chatButton: UIButton = {
        let button = UIButton()
        button.setImage(.chat, for: .normal)
        return button
    }()

    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(.send, for: .normal)
        return button
    }()

    private let bookMarksImageView: UIButton = {
        let imageView = UIButton()
        imageView.setImage(.bookmark, for: .normal)
        return imageView
    }()

    private let avatarCommentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .miniProfil
        return imageView
    }()

    private let nameTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private let likes: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let commented: UILabel = {
        let label = UILabel()
        label.text = NewPostCell.Constants.coment
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private let timeAgo: UILabel = {
        let label = UILabel()
        label.text = NewPostCell.Constants.tenMinsAgo
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
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
        contentView.heightAnchor.constraint(equalToConstant: 440).isActive = true
        contentView.addSubview(avatarImageView)
        contentView.addSubview(pointsImageView)
        contentView.addSubview(postImageView)
        contentView.addSubview(chatButton)
        contentView.addSubview(heartButton)
        contentView.addSubview(sendButton)
        contentView.addSubview(bookMarksImageView)
        contentView.addSubview(avatarCommentImageView)
        contentView.addSubview(nameTitle)
        contentView.addSubview(likes)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(commented)
        contentView.addSubview(timeAgo)
        makeAvatarImageViewConstraints()
        makePostImageViewConstraints()
        makePointsImageViewConstraints()
        makeHeartImageViewConstraints()
        makeChatImageViewConstraints()
        makeSendImageViewConstraints()
        makeBookmarkImageViewConstraints()
        makeMiniAvaImageViewConstraints()
        makeNameTitleConstraints()
        makeLikesTitleConstraints()
        makeDescriptionTitleConstraints()
        makeCommentedTitleConstraints()
        makeTimeTitleConstraints()
    }

    private func makeAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.backgroundColor = .black
    }

    private func makePostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        postImageView.backgroundColor = .yellow
    }

    private func makePointsImageViewConstraints() {
        pointsImageView.translatesAutoresizingMaskIntoConstraints = false
        pointsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        pointsImageView.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -10).isActive = true
        pointsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        pointsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeHeartImageViewConstraints() {
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        heartButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeChatImageViewConstraints() {
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        chatButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 8).isActive = true
        chatButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        chatButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeSendImageViewConstraints() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 8).isActive = true
        sendButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeBookmarkImageViewConstraints() {
        bookMarksImageView.translatesAutoresizingMaskIntoConstraints = false
        bookMarksImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        bookMarksImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        bookMarksImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        bookMarksImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeMiniAvaImageViewConstraints() {
        avatarCommentImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarCommentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        avatarCommentImageView.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 61).isActive = true
        avatarCommentImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        avatarCommentImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeNameTitleConstraints() {
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6)
            .isActive = true
        nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameTitle.widthAnchor.constraint(equalToConstant: 130).isActive = true
        nameTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makeLikesTitleConstraints() {
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        likes.topAnchor.constraint(equalTo: chatButton.bottomAnchor, constant: 6).isActive = true
        likes.widthAnchor.constraint(equalToConstant: 130).isActive = true
        likes.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func makeDescriptionTitleConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: likes.bottomAnchor, constant: 6).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makeCommentedTitleConstraints() {
        commented.translatesAutoresizingMaskIntoConstraints = false
        commented.leadingAnchor.constraint(equalTo: avatarCommentImageView.trailingAnchor, constant: 3)
            .isActive = true
        commented.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6).isActive = true
        commented.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commented.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func makeTimeTitleConstraints() {
        timeAgo.translatesAutoresizingMaskIntoConstraints = false
        timeAgo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        timeAgo.topAnchor.constraint(equalTo: commented.bottomAnchor, constant: 7).isActive = true
        timeAgo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timeAgo.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    // MARK: - Methods

    func setUp(post: Post) {
        avatarImageView.image = UIImage(named: post.avatarImageName)
        postImageView.image = UIImage(named: post.postImages[1])
        nameTitle.text = post.nameTitle
        likes.text = post.likesCount
        descriptionLabel.text = post.descriptionPost
    }
}
