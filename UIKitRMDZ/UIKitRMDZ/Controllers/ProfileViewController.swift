// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// создание контроллера профиль
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum CountCells {
        case profile
        case actualStories
        case allPosts
    }

    // MARK: - Private properties

    private let profileStorage = ProfileStorage()
    private let refreshControl = UIRefreshControl()
    private let tableView = UITableView()
    private let countCells: [CountCells] = [.profile, .actualStories, .allPosts]

    var profileSet: ProfileInfo = .init(
        avatarImage: ConstantProfile.avatar,
        countPhoto: ConstantProfile.countPhotos,
        countPhotoLabel: ConstantProfile.countPhotosName,
        countSubscribers: ConstantProfile.countSubsc,
        countSubscribersLabel: ConstantProfile.countSubscName,
        countSubscriptions: ConstantProfile.countPeople,
        countSubscriptionsLabel: ConstantProfile.countPeopleName,
        nameProfiel: ConstantProfile.accountName,
        proffesionProfiel: ConstantProfile.profession,
        changeProfiel: ConstantProfile.changeProfile,
        shareProfiel: ConstantProfile.shareProfile,
        iconPeople: ConstantProfile.iconPeople
    )

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        setupRefreshControll()
    }

    // MARK: - Private methods

    private func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.register(ActualStoriesCell.self, forCellReuseIdentifier: ActualStoriesCell.identifier)
        tableView.register(PostTileCell.self, forCellReuseIdentifier: PostTileCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refreshData() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - Extension UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        countCells.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = countCells[indexPath.section]
        switch cells {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileCell.identifier,
                for: indexPath
            ) as? ProfileCell else {
                return UITableViewCell()
            }
            cell.setUp(profileInfo: profileSet)
            cell.linkButtonHandler = { [weak self] in
                let controllerToMove = WebViewController()
                self?.present(controllerToMove, animated: true)
            }
            return cell
        case .actualStories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ActualStoriesCell.identifier,
                for: indexPath
            ) as? ActualStoriesCell else { return UITableViewCell() }
            cell.setUpCell(actualStory: profileStorage.actualStories)
            return cell
        case .allPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostTileCell.identifier,
                for: indexPath
            ) as? PostTileCell else {
                return UITableViewCell()
            }
            guard let firstImage = UIImage(named: ConstantProfile.firstPost),
                  let secondImage = UIImage(named: ConstantProfile.secondPost),
                  let thirdImage = UIImage(named: ConstantProfile.thirdPost)
            else {
                return cell
            }

            cell.setImages(images: [firstImage, secondImage, thirdImage])
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = countCells[indexPath.section]
        switch cellType {
        case .profile:
            return 220
        case .actualStories:
            return 90
        case .allPosts:
            return 400
        }
    }
}
