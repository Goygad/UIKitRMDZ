// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс показывающий выбор настроек
final class MenuViewController: UIViewController {
    // MARK: - Private Properties

    let checkController = CheckViewController()

    // MARK: - IBAction

    @IBAction private func goToCheck(_ sender: Any) {
        let alertCheck = UIAlertController(title: "Выставить счет?", message: "", preferredStyle: .alert)
        alertCheck.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertCheck.addAction(UIAlertAction(title: "Чек", style: .default, handler: { [self] _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let checkVc = storyboard.instantiateViewController(withIdentifier: "checkController")
            checkVc.modalPresentationStyle = .fullScreen
            present(checkVc, animated: true)

        }))
        present(alertCheck, animated: true)
    }
}
