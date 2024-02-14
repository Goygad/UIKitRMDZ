// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс с логином и паролем
final class LoginViewController: UIViewController {
    // MARK: - Private properties

    private var secureText = true

    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "КофеиновЪ"
        label.frame = CGRect(x: 100, y: 103, width: 175, height: 75)
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.textColor = UIColor(named: "nameAppColor")
        return label
    }()

    private var backgroundMainView: UIView = {
        let viewBack = UIView()
        viewBack.backgroundColor = .white
        viewBack.layer.cornerRadius = 20
        viewBack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return viewBack
    }()

    private var autorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.frame = CGRect(x: 20, y: 32, width: 195, height: 31)
        label.font = UIFont(name: "Verdana", size: 26)
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()

    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.frame = CGRect(x: 20, y: 84, width: 175, height: 19)
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.frame = CGRect(x: 20, y: 159, width: 195, height: 19)
        label.font = UIFont(name: "Verdana", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 113, width: 195, height: 19)
        textField.placeholder = "Введите почту"
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.frame = CGRect(x: 20, y: 188, width: 195, height: 19)
        textField.addTarget(self, action: #selector(changePasswordField), for: .editingChanged)
        return textField
    }()

    private var loginUnderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 138, width: 335, height: 1)
        view.backgroundColor = .systemGray4
        return view
    }()

    private var passwordUnderView: UIView = {
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
        button.addTarget(self, action: #selector(addVCPresent), for: .touchUpInside)
        return button
    }()

    private var loginButtonImage: UIImageView = {
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
        backgroundMainView.frame = CGRect(x: 0, y: 248, width: view.frame.size.width, height: view.frame.size.height)

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
        loginButton.addSubview(loginButtonImage)
    }

    @objc private func changePasswordField() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(named: "newButtonColor")
    }

    @objc private func addVCPresent() {
        let menu = MenuController()
//        navigationController?.pushViewController(menu, animated: true)
        menu.modalPresentationStyle = .fullScreen
        present(menu, animated: true)
    }

    @objc private func addSecurePass() {
        if secureText == true {
            passwordTextField.isSecureTextEntry = false
            secureText = false
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)

        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            secureText = true
        }
    }
}
