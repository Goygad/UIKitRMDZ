// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс подводящий итог и подсчет
final class CheckViewController: UIViewController {
    // MARK: - Private methods

    @IBAction private func goToGratitude(_ sender: Any) {
        let alertCheck = UIAlertController(title: "Вы хотите оплатить чек?", message: "", preferredStyle: .alert)
        alertCheck.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertCheck.addAction(UIAlertAction(title: "Да", style: .default, handler: { [self] _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let gratitude = storyboard.instantiateViewController(withIdentifier: "gratitudeViewController")
            gratitude.modalPresentationStyle = .fullScreen
            present(gratitude, animated: true)

        }))
        present(alertCheck, animated: true)
    }
}
