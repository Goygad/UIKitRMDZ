// GrainsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// GrainsView отрисовывает элемент экрана выбора ингредиента
final class GrainsView: UIView {
    // MARK: - Public Properties

    let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 124,
            width: 295,
            height: 50
        ))
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }()

    var switcher: UISwitch = {
        let switcher = UISwitch(frame: CGRect(
            x: 305,
            y: 124,
            width: 0,
            height: 0
        ))
        return switcher
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        addSubviews(nameLabel, switcher)
    }
}
