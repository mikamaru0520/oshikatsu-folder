//
//  Oshi.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation

/// 推しの情報を表すモデル
struct Oshi: Identifiable, Equatable, Hashable {
    let id: UUID
    var name: String
    var mainImageName: String // メイン画像（カルーセル用）
    var photos: [Photo] // フォトギャラリー

    init(id: UUID = UUID(), name: String, mainImageName: String, photos: [Photo] = []) {
        self.id = id
        self.name = name
        self.mainImageName = mainImageName
        self.photos = photos
    }
}

/// フォト情報を表すモデル
struct Photo: Identifiable, Equatable, Hashable {
    let id: UUID
    var imageName: String
    var caption: String?
    var date: Date

    init(id: UUID = UUID(), imageName: String, caption: String? = nil, date: Date = Date()) {
        self.id = id
        self.imageName = imageName
        self.caption = caption
        self.date = date
    }
}
