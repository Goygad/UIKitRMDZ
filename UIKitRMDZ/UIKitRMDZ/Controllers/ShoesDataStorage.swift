// ShoesDataStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
/// Хранилище и обработка товаров попадающих в корзину 
final class ShoesDataStorage {
    static let storage = ShoesDataStorage()

    private var shoesModel: [Shoes] = []

    func save(model: [Shoes]) {
        shoesModel = model
    }

    func read() -> [Shoes] {
        shoesModel
    }
}
