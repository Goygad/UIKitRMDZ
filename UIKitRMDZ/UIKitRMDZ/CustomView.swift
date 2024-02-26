// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CustomView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}
