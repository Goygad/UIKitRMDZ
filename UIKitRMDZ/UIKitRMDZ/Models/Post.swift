// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Наполнение поста
struct Post {
    ///картинка профиля
    let avatarImageName: String
    ///имя профиля
    let nameTitle: String
    ///картинки в пикер вью
    let postImages: [String]
    ///количество лайков
    let likesCount: String
    ///описание под постом 
    let descriptionPost: String
}
