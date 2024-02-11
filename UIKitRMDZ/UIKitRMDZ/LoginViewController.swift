// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран логина и входа
final class LoginViewController: UIViewController {
    // MARK: - Private Properties

    private let mainView = UIView()
    private let pieImageView = UIImageView()
    private let applicationNameLabel = UILabel()
    private let signInLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let useFaceIDLabel = UILabel()
    private let switcherID = UISwitch()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let underliningEmailView = UIView()
    private let underliningPassView = UIView()
    private let eyeButton = UIButton()
    private let enterButton = UIButton()
    private var secureText = true

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createMainView()
        createPieImageView()
        createApplicationNameLabel()
        createSignInLabel()
        createEmailLabel()
        createEmailTextField()
        createUnderliningEmailView()
        createPasswordLabel()
        createPasswordTextField()
        createEyeButton()
        createUnderliningPasswordView()
        createUseFaceIDLabel()
        createSwitcherID()
        createEnterButton()
        addSecurePass()
        addStatusPassTextField()
    }

    // MARK: - Private Methods

    private func createMainView() {
        mainView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(mainView)
    }

    private func createPieImageView() {
        pieImageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        pieImageView.image = UIImage(named: "pie")
        mainView.addSubview(pieImageView)
    }

    private func createApplicationNameLabel() {
        applicationNameLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        applicationNameLabel.text = "Birthday\n Reminder"
        applicationNameLabel.numberOfLines = 0
        applicationNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        applicationNameLabel.textColor = UIColor(named: "appNameColor")
        applicationNameLabel.textAlignment = .center
        mainView.addSubview(applicationNameLabel)
    }

    private func createSignInLabel() {
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        signInLabel.text = "Sign in"
        signInLabel.font = .systemFont(ofSize: 26, weight: .bold)
        signInLabel.textAlignment = .center
        signInLabel.textColor = UIColor(named: "mainColor")
        mainView.addSubview(signInLabel)
    }

    private func createEmailLabel() {
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        emailLabel.text = "Email"
        emailLabel.textAlignment = .left
        emailLabel.textColor = UIColor(named: "mainColor")
        emailLabel.font = .systemFont(ofSize: 16, weight: .bold)
        mainView.addSubview(emailLabel)
    }

    private func createEmailTextField() {
        emailTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        emailTextField.placeholder = "Typing email"
        emailTextField.borderStyle = .none
        emailTextField.font = UIFont(name: "Verdana", size: 14)
        mainView.addSubview(emailTextField)
    }

    private func createUnderliningEmailView() {
        underliningEmailView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        underliningEmailView.backgroundColor = .systemGray4
        mainView.addSubview(underliningEmailView)
    }

    private func createPasswordLabel() {
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = UIColor(named: "mainColor")
        passwordLabel.font = .systemFont(ofSize: 16, weight: .bold)
        mainView.addSubview(passwordLabel)
    }

    private func createPasswordTextField() {
        passwordTextField.frame = CGRect(x: 20, y: 422, width: 175, height: 17)
        passwordTextField.placeholder = "Typing password"
        passwordTextField.borderStyle = .none
        passwordTextField.font = UIFont(name: "Verdana", size: 14)
        mainView.addSubview(passwordTextField)
    }

    private func createEyeButton() {
        eyeButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButton.tintColor = .systemGray
        eyeButton.addTarget(self, action: #selector(addSecurePass), for: .touchUpInside)
        mainView.addSubview(eyeButton)
    }

    private func createUnderliningPasswordView() {
        underliningPassView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        underliningPassView.backgroundColor = .systemGray4
        mainView.addSubview(underliningPassView)
    }

    private func createUseFaceIDLabel() {
        useFaceIDLabel.frame = CGRect(x: 86, y: 544, width: 150, height: 35)
        useFaceIDLabel.text = "Use faceID"
        useFaceIDLabel.textAlignment = .center
        useFaceIDLabel.font = .systemFont(ofSize: 16, weight: .bold)
        mainView.addSubview(useFaceIDLabel)
    }

    private func createSwitcherID() {
        switcherID.frame = CGRect(x: 248, y: 544, width: 54, height: 35)
        mainView.addSubview(switcherID)
    }

    private func createEnterButton() {
        enterButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        enterButton.layer.cornerRadius = 12
        enterButton.backgroundColor = UIColor(named: "mainColorLight")
        enterButton.setTitle("Login", for: .normal)
        enterButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        enterButton.addTarget(self, action: #selector(pushToMainView), for: .touchUpInside)
        mainView.addSubview(enterButton)
    }

    private func addStatusPassTextField() {
        passwordTextField.addTarget(self, action: #selector(enterPasswordTextField), for: .editingChanged)
    }

    @objc private func enterPasswordTextField() {
        enterButton.isEnabled = true
        enterButton.backgroundColor = UIColor(named: "mainColor")
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

    @objc private func pushToMainView() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
}
