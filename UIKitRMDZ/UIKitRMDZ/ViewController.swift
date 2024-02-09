// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    // MARK: - Public Properties

    var iconClick: Bool!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBAction func iconPressed(_ sender: UIButton) {
        if iconClick == true {
            passwordTextField.isSecureTextEntry = false
            iconClick = false
        } else {
            passwordTextField.isSecureTextEntry = true
            iconClick = true
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        iconClick = true

        guard passwordTextField.text != nil else {
            return enterButton.backgroundColor = .red
        }
    }
}
