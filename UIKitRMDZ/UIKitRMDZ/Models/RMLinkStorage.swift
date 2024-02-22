// RMLinkStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

enum RMConstant {
    static let myPlus = "myPlus"
    static let lavanda = "lavanda"
    static let canyon = "canyon"
    static let caucasian = "caucasian"
    static let tour = "tur_v_dagestan"
    static let crimea = "crimea"
    static let valley = "valley"
    static let woman = "woman"
    static let youngMan = "youngMan"
    static let miniProfil = "miniProfil"
    static let crimeaName = "crimea_082"
    static let womanName = "mary_pol"
    static let likes = "Нравится: 201"
    static let descriptionPost =
        "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
}

/// Хранилище наполнения новостной ленты
struct RMLinkStorage {
    ///сторис
    let stories = [RMConstant.myPlus, RMConstant.lavanda]
    ///посты
    let posts: [Post] = [.init(
        avatarImageName: RMConstant.caucasian,
        nameTitle: RMConstant.tour,
        postImages: [RMConstant.canyon, RMConstant.valley, RMConstant.woman],
        likesCount: RMConstant.likes,
        descriptionPost: RMConstant.descriptionPost
    )]
    ///рекомендации
    let recomended: [RecomendedAccaounts] = [.init(
        avatarImageName: [RMConstant.crimea, RMConstant.woman],
        nameAccount: [RMConstant.crimeaName, RMConstant.womanName]
    )]
}
