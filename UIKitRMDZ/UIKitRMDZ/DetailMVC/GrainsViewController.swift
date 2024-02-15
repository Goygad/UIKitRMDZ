// GrainsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// GrainsViewController отображает дополнительные ингрeдиенты
final class GrainsViewController: UIViewController {
    // MARK: - Private Properties

    private let orderModel = OrderModel()
    private var totalAmount = 0
    private let titles = [
        "",
        "Молоко +50 руб",
        "Сироп +20 руб",
        "Молоко соевое +50 руб",
        "Молоко миндальное +70 руб",
        "Эспрессо 50мл +50 руб"
    ]
    private let prices = [50, 20, 50, 70, 50]
    private var stateSwitches = [true, true, false, false, false, false]

    private var switchers: [UISwitch] = []

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 53,
            width: 350,
            height: 60
        ))
        label.text = "Выберите дополнительные ингредіенты"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 26,
            width: 14,
            height: 14
        ))
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupSubview()
    }

    override func viewWillLayoutSubviews() {
        updatedSwitch()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, cancelButton)
        configureView()
    }

    private func configureView() {
        for index in 1 ..< titles.count {
            let grainsView = GrainsView(frame: CGRect(
                x: 0,
                y: CGFloat(50 * index),
                width: view.frame.width,
                height: 50
            ))
            view.addSubview(grainsView)
            let text = titles[index]
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(
                .foregroundColor,
                value: UIColor(named: "AppGreen") as Any,
                range: NSRange(location: text.count - 7, length: 7)
            )
            grainsView.nameLabel.attributedText = attributedString
            grainsView.switcher.tag = index
            grainsView.switcher.setOn(stateSwitches[index - 1], animated: true)
            grainsView.switcher.addTarget(
                self,
                action: #selector(valueChangeSwitch(_:)),
                for: .valueChanged
            )
            switchers.append(grainsView.switcher)
        }
    }

    private func updatedSwitch() {
        for switcher in switchers {
            switcher.setOn(switcher.isOn, animated: true)
        }
    }

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }

    @objc private func valueChangeSwitch(_ sender: UISwitch) {
        stateSwitches[sender.tag] = sender.isOn
        switchers[sender.tag].setOn(stateSwitches[sender.tag], animated: true)
        if sender.isOn {
            totalAmount += prices[sender.tag]
        } else {
            totalAmount -= prices[sender.tag]
        }
    }
}
