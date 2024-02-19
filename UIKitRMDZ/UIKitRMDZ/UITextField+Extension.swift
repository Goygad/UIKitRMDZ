// UITextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UITextField {
    func textRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: 10, dy: 10)
    }

    func editingRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: 10, dy: 10)
    }

    func placeholderRect(forBounds: CGRect) -> CGRect {
        forBounds.insetBy(dx: 10, dy: 10)
    }
}
