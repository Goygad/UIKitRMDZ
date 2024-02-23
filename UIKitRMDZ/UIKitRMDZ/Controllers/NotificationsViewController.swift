// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let viewTitleText = "Уведомления"
        static let requestLabelText = "Запросы на подписку"
        static let notificationViewCellIdentifier = "NotificationViewCell"
        static let todayHeader = "Сегодня"
        static let thisWeekHeader = "На этой неделе"
        static let lavandaProfil = "lavanda"
        static let textCommentOne = "lavanda123 понравился ваш комментарий: 'Очень красиво!' 12ч"
        static let textCommentTwo = "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 12ч"
        static let textCommentFour = "lavanda123 понравился ваш комментарий: 'Ты вернулась?' 7д."
        static let museumImage = "museum"
        static let oceanImage = "ocean"
        static let youngBoy = "youngBoy"
        static let boy = "boy"
        static let girl = "girl"
        static let textButtonCommentOne = "lavanda123 понравился ваш комментарий: 'Это где?' 3д."
        static let textButtonCommentTwo = "12miho появился(-ась) в RMLink. Вы можете быть знакомы 3д."
        static let textButtonCommentThree = "lavanda123 подписался(-ась) на ваши новости 5д."
        static let textButtonCommentFour = "lavanda123 понравился ваш комментарий: 'Ты вернулась?' 7д."
        static let textButtonCommentFive = "markS появился(-ась) в RMLink. Вы можете быть знакомы 8д."
        static let textButtonCommentSix = "sv_neit появился(-ась) в RMLink. Вы можете быть знакомы 8д."
    }

    enum ContentType {
        case today
        case thisWeek
    }

    // MARK: - Private properties

    private var tableView = UITableView()
    private var content: [ContentType] = [.today, .thisWeek]

    private var todayNotifications: [PostModel] = [
        PostModel(
            profileImage: Constants.lavandaProfil,
            text: Constants.textCommentOne,
            postImage: Constants.oceanImage,
            isButtonVisible: true
        ),
        PostModel(
            profileImage: Constants.girl,
            text: Constants.textCommentTwo,
            postImage: Constants.oceanImage,
            isButtonVisible: true
        )
    ]

    private var thisWeeknotifications: [PostModel] = [
        PostModel(
            profileImage: Constants.boy,
            text: Constants.textCommentFour,
            postImage: Constants.museumImage,
            isButtonVisible: true

        ),
        PostModel(
            profileImage: Constants.girl,
            text: Constants.textButtonCommentOne,
            postImage: Constants.oceanImage,
            isButtonVisible: false
        ),

        PostModel(
            profileImage: Constants.boy,
            text: Constants.textCommentOne,
            postImage: Constants.oceanImage,
            isButtonVisible: true

        ),
        PostModel(
            profileImage: Constants.youngBoy,
            text: Constants.textCommentTwo,
            postImage: Constants.museumImage,
            isButtonVisible: false
        ),

        PostModel(
            profileImage: Constants.boy,
            text: Constants.textCommentOne,
            postImage: Constants.oceanImage,
            isButtonVisible: true

        ),
        PostModel(
            profileImage: Constants.youngBoy,
            text: Constants.textCommentTwo,
            postImage: Constants.oceanImage,
            isButtonVisible: false
        )
    ]

    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestLabelText
        label.font = .init(name: "Verdana", size: 12)
        return label
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = .white
        createTableView()
        configureNavigationItem()
        addLabelRequests()
        createRefreshControl()
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

    private func configureNavigationItem() {
        let titleView: UILabel = {
            let label = UILabel()
            label.text = Constants.viewTitleText
            label.font = .init(name: "Verdana-Bold", size: 22)
            return label
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }

    private func createTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.register(PictureCell.self, forCellReuseIdentifier: PictureCell.identifier)
        tableView.register(ButtonViewCell.self, forCellReuseIdentifier: ButtonViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func addLabelRequests() {
        view.addSubview(requestLabel)
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
            .isActive = true
        requestLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        requestLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    @objc func handleRefreshControl() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - Extension UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch content[section] {
        case .today:
            return todayNotifications.count
        case .thisWeek:
            return thisWeeknotifications.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch content[indexPath.section] {
        case .today:
            let notification = todayNotifications[indexPath.row]
            switch notification.isButtonVisible {
            case true:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: PictureCell.identifier,
                    for: indexPath
                ) as? PictureCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell

            case false:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonViewCell.identifier,
                    for: indexPath
                ) as? ButtonViewCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell
            }

        case .thisWeek:
            let notification = thisWeeknotifications[indexPath.row]
            switch notification.isButtonVisible {
            case true:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: PictureCell.identifier,
                    for: indexPath
                ) as? PictureCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell

            case false:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: ButtonViewCell.identifier,
                    for: indexPath
                ) as? ButtonViewCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell
            }
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell
        .EditingStyle
    {
        .delete
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            switch content[indexPath.section] {
            case .today:
                todayNotifications.remove(at: indexPath.row)
            case .thisWeek:
                thisWeeknotifications.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

// MARK: - Extension UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))

        let label = UILabel(frame: CGRect(x: 15, y: 10, width: tableView.frame.size.width - 30, height: 30))
        if section == 0 {
            label.text = Constants.todayHeader
        } else if section == 1 {
            label.text = Constants.thisWeekHeader
        }

        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)

        headerView.addSubview(label)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
