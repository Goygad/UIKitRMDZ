// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit
/// Модель данных поступающих в корзину 
struct Shoes {
    var image: Image
    var price: String
}

enum Image: String {
    case womShoesBlack
    case womShoesCatalogBlack
    case womShoesCatalogRed
    case womShoesCatalogYellow
    case womShoesCatalogWhite
}
