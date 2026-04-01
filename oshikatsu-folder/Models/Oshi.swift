//
//  Oshi.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation
import SwiftData

/// 画像のタイプ
enum ImageType: String, Codable {
    case icon      // SF Symbolsアイコン
    case photo     // 実際の画像ファイル
}

/// 推しの情報を表すモデル
@Model
final class Oshi {
    @Attribute(.unique) var id: UUID
    var name: String
    var mainImageName: String // メイン画像（カルーセル用：アイコン名またはファイル名）
    var imageType: ImageType // 画像タイプ

    @Relationship(deleteRule: .cascade, inverse: \Photo.oshi)
    var photos: [Photo] = [] // フォトギャラリー

    init(id: UUID = UUID(), name: String, mainImageName: String, imageType: ImageType = .icon, photos: [Photo] = []) {
        self.id = id
        self.name = name
        self.mainImageName = mainImageName
        self.imageType = imageType
        self.photos = photos
    }
}

/// フォト情報を表すモデル
@Model
final class Photo {
    @Attribute(.unique) var id: UUID
    var imageName: String
    var caption: String?
    var date: Date

    var oshi: Oshi?

    init(id: UUID = UUID(), imageName: String, caption: String? = nil, date: Date = Date()) {
        self.id = id
        self.imageName = imageName
        self.caption = caption
        self.date = date
    }
}
