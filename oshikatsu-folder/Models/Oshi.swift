//
//  Oshi.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation

/// 画像のタイプ
enum ImageType: String, Codable, Equatable, Hashable {
    case icon      // SF Symbolsアイコン
    case photo     // 実際の画像ファイル
}

/// 推しの情報を表すモデル
struct Oshi: Identifiable, Equatable, Hashable {
    let id: UUID
    var name: String
    var mainImageName: String // メイン画像（カルーセル用：アイコン名またはファイル名）
    var imageType: ImageType // 画像タイプ
    var photos: [Photo] // フォトギャラリー

    init(id: UUID = UUID(), name: String, mainImageName: String, imageType: ImageType = .icon, photos: [Photo] = []) {
        self.id = id
        self.name = name
        self.mainImageName = mainImageName
        self.imageType = imageType
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
