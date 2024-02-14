// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let appName = "КофеиновЪ"
        static let autorization = "Авторизация"
        static let login = "Логин"
        static let password = "Пароль"
        static let loginPlaceholder = "Введите почту"
        static let passwordPlaceholder = "Введите пароль"
        static let verdana = "Verdana"
        static let verdanaItalic = "Verdana-Italic"
        static let verdanaBoldItalic = "Verdana-BoldItalic"
    }

    private var isSecureText = true

    // MARK: - Visual

    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.appName
        label.frame = CGRect(x: 100, y: 103, width: 175, height: 75)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.textColor = UIColor(named: "nameAppColor")
        return label
    }()

    private lazy var backgroundMainView: UIView = {
        let viewBack = UIView()
        viewBack.frame = CGRect(x: 0, y: 248, width: view.frame.size.width, height: view.frame.size.height)
        viewBack.backgroundColor = .white
        viewBack.layer.cornerRadius = 20
        viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return viewBack
    }()

    private let autorizationLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.autorization
        label.frame = CGRect(x: 20, y: 32, width: 195, height: 31)
        label.font = UIFont(name: Constant.verdana, size: 26)
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.login
        label.frame = CGRect(x: 20, y: 84, width: 175, height: 19)
        label.font = UIFont(name: Constant.verdana, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.password
        label.frame = CGRect(x: 20, y: 159, width: 195, height: 19)
        label.font = UIFont(name: Constant.verdana, size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 113, width: 195, height: 19)
        textField.placeholder = Constant.loginPlaceholder
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constant.passwordPlaceholder
        textField.frame = CGRect(x: 20, y: 188, width: 195, height: 19)
        textField.addTarget(self, action: #selector(changePasswordField), for: .editingChanged)
        return textField
    }()

    private let loginUnderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 138, width: 335, height: 1)
        view.backgroundColor = .systemGray4
        return view
    }()

    private let passwordUnderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 214, width: 335, height: 1)
        view.backgroundColor = .systemGray4
        return view
    }()

    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 333, y: 185, width: 22, height: 15)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(addSecurePass), for: .touchUpInside)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(named: "newButtonColorLight")
        button.layer.cornerRadius = 12
        button.isEnabled = false
        button.addTarget(self, action: #selector(showMenuViewController), for: .touchUpInside)
        return button
    }()

    private let loginButtonImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 252, y: 2, width: 45, height: 45)
        image.image = UIImage(named: "bean")
        return image
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLoginButton()
    }

    // MARK: - Private methods

    private func setLoginButton() {
        if passwordTextField.text?.isEmpty == true {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }

    private func setUI() {
        view.backgroundColor = UIColor(named: "back")
        view.addSubview(backgroundMainView)
        view.addSubview(appNameLabel)
        backgroundMainView.addSubview(autorizationLabel)
        backgroundMainView.addSubview(loginLabel)
        backgroundMainView.addSubview(passwordLabel)
        backgroundMainView.addSubview(loginTextField)
        backgroundMainView.addSubview(passwordTextField)
        backgroundMainView.addSubview(loginUnderView)
        backgroundMainView.addSubview(passwordUnderView)
        backgroundMainView.addSubview(eyeButton)
        backgroundMainView.addSubview(loginButton)
        loginButton.addSubview(loginButtonImageView)
    }

    @objc private func changePasswordField() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = .newButton
    }

    @objc private func showMenuViewController() {
        let menuViewController = MenuViewController()
        let navController = UINavigationController(rootViewController: menuViewController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }

    @objc private func addSecurePass() {
        passwordTextField.isSecureTextEntry = isSecureText ? false : true
        eyeButton.setImage(UIImage(systemName: isSecureText ? "eye.slash.fill" : "eye.fill"), for: .normal)
        isSecureText = isSecureText ? false : true
    }
}
