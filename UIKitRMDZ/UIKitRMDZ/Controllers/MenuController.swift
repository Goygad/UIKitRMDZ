// MenuController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс с меню кафе
final class MenuController: UIViewController {
    // MARK: - Private properties

    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "КофеиновЪ"
        label.frame = CGRect(x: 100, y: 49, width: 175, height: 75)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.textColor = UIColor(named: "nameAppColor")
        return label
    }()

    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,\nГость"
        label.numberOfLines = 0
        label.frame = CGRect(x: 20, y: 147, width: 185, height: 44)
        label.font = UIFont(name: "Verdana-Italic", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()

    private var guestImage: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttons")
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
        button.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        button.layer.cornerRadius = button.frame.size.width / 2
        return button
    }()

    private var backgroundMainView: UIView = {
        let viewBack = UIView()
        viewBack.backgroundColor = .white
        viewBack.layer.cornerRadius = 20
        viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return viewBack
    }()

    private var adressBackView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
        backView.backgroundColor = UIColor(named: "adressViewColor")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private var pointAtadressViewImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 289, y: 20, width: 20, height: 29)
        image.image = UIImage(named: "point")
        return image
    }()

    private var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адреса кофеен"
        label.numberOfLines = 0
        label.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        label.font = UIFont(name: "Verdana", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()

    private var acceptGeoLabel: UILabel = {
        let label = UILabel()
        label.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        label.numberOfLines = 0
        label.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        label.font = UIFont(name: "Verdana", size: 12)
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private var menuImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 125, y: 122, width: 125, height: 80)
        image.image = UIImage(named: "menu")
        return image
    }()

    private var menuElementPieView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 216, width: 335, height: 80)
        backView.backgroundColor = UIColor(named: "menuElement")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private var pieLabel: UILabel = {
        let label = UILabel()
        label.text = "Пти пате аля «РюсЪ»"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private var pieImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 5, width: 70, height: 70)
        image.image = UIImage(named: "pie")
        return image
    }()

    private var menuElementDrinksView: UIView = {
        let backView = UIView()
        backView.frame = CGRect(x: 20, y: 316, width: 335, height: 80)
        backView.backgroundColor = UIColor(named: "menuElement")
        backView.layer.cornerRadius = 16
        return backView
    }()

    private var drinksLabel: UILabel = {
        let label = UILabel()
        label.text = "Горячiя напитки"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private var drinksImageView: UIImageView = {
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

    private var coffeLabel: UILabel = {
        let label = UILabel()
        label.text = "Кофий"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.frame = CGRect(x: 25, y: 30, width: 220, height: 19)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16.0)
        label.textColor = .black
        return label
    }()

    private var coffeImageView: UIImageView = {
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

        backgroundMainView.frame = CGRect(x: 0, y: 248, width: view.frame.size.width, height: view.frame.size.height)

        view.addSubview(appNameLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(guestImage)
        view.addSubview(backgroundMainView)

        backgroundMainView.addSubview(adressBackView)
        backgroundMainView.addSubview(menuImage)
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

    @objc private func presentDetails() {
        let details = DetailCoffeeViewController()
        let test = GratitudeController()
        navigationController?.pushViewController(test, animated: true)
    }
}
