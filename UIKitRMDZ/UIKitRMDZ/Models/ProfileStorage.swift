// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

enum ConstantProfile {
    static let avatar = "MyAvatar"
    static let countPhotos = "67"
    static let countSubsc = "458"
    static let countPeople = "120"
    static let countPhotosName = "публикации"
    static let countSubscName = "подписчики"
    static let countPeopleName = "подписки"
    static let accountName = "Мария Иванова"
    static let profession = "Консультант"
    static let shareProfile = "Поделиться профилем"
    static let changeProfile = "Изменить"
    static let iconPeople = "iconPeople"
    static let starShip = "starShipActual"
    static let moon = "moonActual"
    static let spaceman = "spacemanActual"
    static let space = "spaceActual"
    static let firstPost = "starShipImg"
    static let secondPost = "earth"
    static let thirdPost = "openSpace"
}

/// Хранилище профиля
struct ProfileStorage {
    /// Информация о профиле
    let profileInfo: [ProfileInfo] = [
        .init(
            avatarImage: ConstantProfile.avatar,
            countPhoto: ConstantProfile.countPhotos,
            countPhotoLabel: ConstantProfile.countPhotosName,
            countSubscribers: ConstantProfile.countSubsc,
            countSubscribersLabel: ConstantProfile.countSubscName,
            countSubscriptions: ConstantProfile.countPeople,
            countSubscriptionsLabel: ConstantProfile.countPeopleName,
            nameProfiel: ConstantProfile.accountName,
            proffesionProfiel: ConstantProfile.profession,
            changeProfiel: ConstantProfile.changeProfile,
            shareProfiel: ConstantProfile.shareProfile,
            iconPeople: ConstantProfile.iconPeople
        )
    ]
    /// Актуальные истории
    let actualStories = [
        ConstantProfile.starShip,
        ConstantProfile.moon,
        ConstantProfile.spaceman,
        ConstantProfile.space
    ]
}
