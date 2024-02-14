// MenuController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс с меню кафе
final class MenuViewController: UIViewController {
    // MARK: - Constants

    /// Содержание ячейки с адресом
    private enum Adress: String {
        case textAdress = "Адреса кофеен"
        case description = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
    }

    /// Названия ячеек меню
    private enum MenuPoints: String {
        case pie = "Пти пате аля «РюсЪ»"
        case drinks = "Горячiя напитки"
        case coffe = "Кофий"
    }

    // MARK: - Visual

    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "КофеиновЪ"
        label.frame = CGRect(x: 100, y: 49, width: 175, height: 75)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.textColor = UIColor(named: "nameAppColor")
        return label
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,\nГость"
        label.numberOfLines = 0
        label.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        label.font = UIFont(name: "Verdana-Italic", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()

    private let guestImageView: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttons")
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        button.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        button.layer.cornerRadius = button.frame.size.width / 2
        return button
    }()

    private lazy var backgroundMainView: UIView = {
        let viewBack = UIView()
        viewBack.frame = CGRect(x: 0, y: 248, width: view.frame.size.width, height: view.frame.size.height)
        viewBack.backgroundColor = .white
        viewBack.layer.cornerRadius = 20
        viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return viewBack
    }()

    private let adressBackView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        backView.backgroundColor = UIColor(named: "adressViewColor")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private let pointAtadressViewImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 289, y: 20, width: 20, height: 29)
        image.image = UIImage(named: "point")
        return image
    }()

    private let adressLabel: UILabel = {
        let label = UILabel()
        label.text = Adress.textAdress.rawValue
        label.numberOfLines = 0
        label.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        label.font = UIFont(name: "Verdana", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let acceptGeoLabel: UILabel = {
        let label = UILabel()
        label.text = Adress.description.rawValue
        label.numberOfLines = 0
        label.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        label.font = UIFont(name: "Verdana", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private let menuImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 125, y: 122, width: 125, height: 80)
        image.image = UIImage(named: "menu")
        return image
    }()

    private let menuElementPieView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 216, width: 335, height: 80)
        backView.backgroundColor = UIColor(named: "menuElement")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private let pieLabel: UILabel = {
        let label = UILabel()
        label.text = MenuPoints.pie.rawValue
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private let pieImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        image.image = UIImage(named: "pie")
        return image
    }()

    private let menuElementDrinksView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 316, width: 335, height: 80)
        backView.backgroundColor = UIColor(named: "menuElement")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private let drinksLabel: UILabel = {
        let label = UILabel()
        label.text = MenuPoints.drinks.rawValue
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private let drinksImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 20, width: 70, height: 44)
        image.image = UIImage(named: "cup")
        return image
    }()

    private lazy var coffeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "menuElement")
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 80)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(presentDetails), for: .touchUpInside)
        return button
    }()

    private let coffeLabel: UILabel = {
        let label = UILabel()
        label.text = MenuPoints.coffe.rawValue
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private let coffeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        image.image = UIImage(named: "cup2")
        return image
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private methods

    private func setUI() {
        view.backgroundColor = UIColor(named: "back")

        view.addSubview(appNameLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(guestImageView)
        view.addSubview(backgroundMainView)

        backgroundMainView.addSubview(adressBackView)
        backgroundMainView.addSubview(menuImageView)
        backgroundMainView.addSubview(menuElementPieView)
        backgroundMainView.addSubview(menuElementDrinksView)
        backgroundMainView.addSubview(coffeButton)

        adressBackView.addSubview(adressLabel)
        adressBackView.addSubview(pointAtadressViewImage)
        adressBackView.addSubview(acceptGeoLabel)

        menuElementPieView.addSubview(pieLabel)
        menuElementPieView.addSubview(pieImageView)

        menuElementDrinksView.addSubview(drinksLabel)
        menuElementDrinksView.addSubview(drinksImageView)

        coffeButton.addSubview(coffeLabel)
        coffeButton.addSubview(coffeImageView)
    }

    // TODO: Реализовать переход на экарн деталей
    @objc private func presentDetails() {
        let details = DetailCoffeeViewController()
        let test = GratitudeController()
        navigationController?.pushViewController(test, animated: true)
    }
}
