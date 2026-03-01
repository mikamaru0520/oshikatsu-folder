//
//  AppState.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation

/// アプリケーション全体の状態を表す不変データ構造
struct AppState: Equatable {
    var isLoading: Bool = false
    var errorMessage: String?

    // 推し活関連の状態をここに追加していく
}
