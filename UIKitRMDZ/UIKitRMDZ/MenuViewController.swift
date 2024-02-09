// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    let checkController = CheckViewController()

    // MARK: - Methods

    @IBAction func goToCheck(_ sender: Any) {
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
