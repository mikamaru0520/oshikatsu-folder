//
//  AppIntent.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation

/// ユーザーの意図・アクションを定義
enum AppIntent {
    case idle
    case selectOshi(Oshi)
    case deselectOshi
    case addOshi(name: String, mainImageName: String, imageType: ImageType)
}
