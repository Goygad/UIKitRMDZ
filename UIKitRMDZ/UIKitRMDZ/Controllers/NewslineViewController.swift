// NewslineViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Лента новостей
final class NewslineViewController: UIViewController {
    // MARK: - Constants

    enum CountRows {
        case stories
        case firstPost
        case reccomend
        case posts
    }

    // MARK: - Private properties

    private let rmLinkStorage = RMLinkStorage()
    private let tableView = UITableView()

    private let rowsType: [CountRows] = [
        .stories,
        .firstPost,
        .reccomend,
        .posts
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)

        createRefreshControl()
        createTableView()
    }

    private func createTableView() {
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier)
        tableView.register(NewPostCell.self, forCellReuseIdentifier: NewPostCell.identifier)
        tableView.register(RecomendedCell.self, forCellReuseIdentifier: RecomendedCell.identifier)
        tableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    private func createRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action:
            #selector(handleRefreshControl),
            for: .valueChanged
        )
        tableView.refreshControl?.tintColor = .lightGray
    }

    @objc func handleRefreshControl() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - Extension UITableViewDataSource

extension NewslineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = rowsType[section]
        switch cellType {
        case .stories, .firstPost, .reccomend:
            return 1
        case .posts:
            return 6
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = rowsType[indexPath.section]
        switch cells {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as? StoriesCell
            else { return UITableViewCell() }
            cell.setupCell(stories: rmLinkStorage.stories)
            return cell

        case .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: NewPostCell.identifier, for: indexPath) as? NewPostCell
            else { return UITableViewCell() }
            cell.setUp(post: Post(
                avatarImageName: RMConstant.caucasian,
                nameTitle: RMConstant.tour,
                postImages: [
                    RMConstant.canyon,
                    RMConstant.valley,
                    RMConstant.woman
                ],
                likesCount: RMConstant.likes,
                descriptionPost: RMConstant.descriptionPost
            ))

            return cell

        case .reccomend:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecomendedCell.identifier,
                for: indexPath
            ) as? RecomendedCell else { return UITableViewCell() }
            cell.setupRec(recomend: RecomendedAccaounts(
                avatarImageName: [RMConstant.crimea, RMConstant.woman],
                nameAccount: [RMConstant.crimeaName, RMConstant.womanName]
            ))
            return cell

        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostsCell.identifier, for: indexPath) as? PostsCell
            else { return UITableViewCell() }
            cell.setUp(
                post: Post(
                    avatarImageName: RMConstant.caucasian,
                    nameTitle: RMConstant.tour,
                    postImages: [
                        RMConstant.canyon,
                        RMConstant.valley,
                        RMConstant.woman
                    ],
                    likesCount: RMConstant.likes,
                    descriptionPost: RMConstant.descriptionPost
                )
            )
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate

extension NewslineViewController: UITableViewDelegate {}
