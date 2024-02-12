// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения
final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let mainNameLabel = UILabel()
    private let helenaNameLabel = UILabel()
    private let helenaTurnsLabel = UILabel()
    private let veronaNameLabel = UILabel()
    private let veronaTurnsLabel = UILabel()
    private let alexNameLabel = UILabel()
    private let alexTurnsLabel = UILabel()
    private let tomNameLabel = UILabel()
    private let tomTurnsLabel = UILabel()
    private let helenaImage = UIImageView()
    private let veronaImage = UIImageView()
    private let alexImage = UIImageView()
    private let tomImage = UIImageView()
    private let helenaNumberOfDays = UIImageView()
    private let veronaNumberOfDays = UILabel()
    private let alexNumberOfDays = UILabel()
    private let tomNumberOfDays = UILabel()
    private let backButton = UIButton()
    private let addButton = UIButton()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        createMainName()
        createHelena()
        createVerona()
        createAlex()
        createTom()
        addBackButton()
        addAddingButton()
    }

    // MARK: - Private Methods

    private func setView() {
        view.backgroundColor = .white
    }

    private func createMainName() {
        mainNameLabel.text = "Birthday Reminder"
        mainNameLabel.frame = CGRect(x: 86, y: 50, width: 209, height: 20)
        mainNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        mainNameLabel.textAlignment = .center
        view.addSubview(mainNameLabel)
    }

    private func createHelena() {
        helenaNameLabel.text = "Helena Link"
        helenaNameLabel.frame = CGRect(x: 100, y: 120, width: 209, height: 20)
        helenaNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(helenaNameLabel)

        helenaTurnsLabel.text = "10.03 - turns 25!"
        helenaTurnsLabel.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        view.addSubview(helenaTurnsLabel)

        helenaImage.image = UIImage(named: "helena")
        helenaImage.frame = CGRect(x: 20, y: 105, width: 75, height: 75)
        view.addSubview(helenaImage)

        helenaNumberOfDays.image = UIImage(named: "pieSmile")
        helenaNumberOfDays.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        view.addSubview(helenaNumberOfDays)
    }

    private func createVerona() {
        veronaNameLabel.text = "Verona Tusk"
        veronaNameLabel.frame = CGRect(x: 100, y: 214, width: 209, height: 20)
        veronaNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(veronaNameLabel)

        veronaTurnsLabel.text = "20.03 - turns 39!"
        veronaTurnsLabel.frame = CGRect(x: 102, y: 242, width: 209, height: 20)
        view.addSubview(veronaTurnsLabel)

        veronaImage.image = UIImage(named: "verona")
        veronaImage.frame = CGRect(x: 20, y: 200, width: 75, height: 75)
        view.addSubview(veronaImage)

        veronaNumberOfDays.text = "10\n days"
        veronaNumberOfDays.frame = CGRect(x: 315, y: 214, width: 44, height: 44)
        veronaNumberOfDays.numberOfLines = 0
        veronaNumberOfDays.textColor = UIColor(named: "appNameColor")
        veronaNumberOfDays.textAlignment = .center
        veronaNumberOfDays.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(veronaNumberOfDays)
    }

    private func createAlex() {
        alexNameLabel.text = "Alex Smith"
        alexNameLabel.frame = CGRect(x: 100, y: 309, width: 209, height: 20)
        alexNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(alexNameLabel)

        alexTurnsLabel.text = "21.04 - turns 51!"
        alexTurnsLabel.frame = CGRect(x: 102, y: 337, width: 209, height: 20)
        view.addSubview(alexTurnsLabel)

        alexImage.image = UIImage(named: "alex")
        alexImage.frame = CGRect(x: 20, y: 295, width: 75, height: 75)
        view.addSubview(alexImage)

        alexNumberOfDays.text = "42\n days"
        alexNumberOfDays.frame = CGRect(x: 315, y: 309, width: 44, height: 44)
        alexNumberOfDays.numberOfLines = 0
        alexNumberOfDays.textColor = UIColor(named: "appNameColor")
        alexNumberOfDays.textAlignment = .center
        alexNumberOfDays.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(alexNumberOfDays)
    }

    private func createTom() {
        tomNameLabel.text = "Tom Johnson"
        tomNameLabel.frame = CGRect(x: 100, y: 404, width: 209, height: 20)
        tomNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(tomNameLabel)

        tomTurnsLabel.text = "05.06 - turns 18!"
        tomTurnsLabel.frame = CGRect(x: 102, y: 432, width: 209, height: 20)
        view.addSubview(tomTurnsLabel)

        tomImage.image = UIImage(named: "tom")
        tomImage.frame = CGRect(x: 20, y: 390, width: 75, height: 75)
        view.addSubview(tomImage)

        tomNumberOfDays.text = "87\n days"
        tomNumberOfDays.frame = CGRect(x: 315, y: 404, width: 44, height: 44)
        tomNumberOfDays.numberOfLines = 0
        tomNumberOfDays.textColor = UIColor(named: "appNameColor")
        tomNumberOfDays.textAlignment = .center
        tomNumberOfDays.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(tomNumberOfDays)
    }

    private func addBackButton() {
        backButton.frame = CGRect(x: 30, y: 50, width: 50, height: 25)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.systemBlue, for: .normal)
        backButton.addTarget(self, action: #selector(pushToLogin), for: .touchUpInside)
        view.addSubview(backButton)
    }

    private func addAddingButton() {
        addButton.frame = CGRect(x: 339, y: 50, width: 20, height: 20)
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = .systemBlue
        addButton.addTarget(self, action: #selector(pushToNewAdding), for: .touchUpInside)
        view.addSubview(addButton)
    }

    @objc private func pushToNewAdding() {
        let newBirthdayAdding = NewBirthdayAdding()
        newBirthdayAdding.modalPresentationStyle = .automatic
        present(newBirthdayAdding, animated: true)
    }

    @objc private func pushToLogin() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}
