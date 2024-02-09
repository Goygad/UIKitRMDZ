// Convertor.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Модель с логикой выполнения игры
final class Convertor {
    // MARK: - Public Methods

    func addReversedText(text: String) -> String {
        let txt = text.reversed()
        return String(txt)
    }
}
