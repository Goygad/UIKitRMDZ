// PictureCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с коментарием к фото
final class PictureCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = "PictureCell"

    // MARK: - Private properties

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    private let commentedImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.backgroundColor = .white
        contentView.addSubview(userImageView)
        contentView.addSubview(commentLabel)
        contentView.addSubview(commentedImageView)

        makeUserImage()
        makeCommentLabel()
        makeCommentImageView()
    }

    private func makeUserImage() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }

    private func makeCommentLabel() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func makeCommentImageView() {
        commentedImageView.translatesAutoresizingMaskIntoConstraints = false
        commentedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        commentedImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentedImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    }

    // MARK: - Methods

    func configure(info: PostModel) {
        userImageView.image = UIImage(named: info.profileImage)
        commentLabel.text = info.text
        commentedImageView.image = UIImage(named: info.postImage)
    }
}
