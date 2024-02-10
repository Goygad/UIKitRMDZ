// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс отвечающий за страницу логина и пароля
final class LoginViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var passwordTextField: UITextField!

    // MARK: - Private Properties

    private var iconClick = true

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IBAction

    @IBAction private func iconPressed(_ sender: UIButton) {
        if iconClick == true {
            passwordTextField.isSecureTextEntry = false
            iconClick = false
        } else {
            passwordTextField.isSecureTextEntry = true
            iconClick = true
        }
    }
}
