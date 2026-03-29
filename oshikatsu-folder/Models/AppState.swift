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

    // 推し活関連の状態
    var oshiList: [Oshi] = []
    var selectedOshi: Oshi? = nil

    // テスト用のダミーデータ
    static var preview: AppState {
        var state = AppState()
        state.oshiList = [
            Oshi(name: "推し1", mainImageName: "star.fill", photos: [
                Photo(imageName: "photo.fill", caption: "素敵な写真1"),
                Photo(imageName: "photo.fill", caption: "素敵な写真2"),
                Photo(imageName: "photo.fill", caption: "素敵な写真3")
            ]),
            Oshi(name: "推し2", mainImageName: "heart.fill", photos: [
                Photo(imageName: "photo.fill", caption: "かわいい写真1"),
                Photo(imageName: "photo.fill", caption: "かわいい写真2")
            ]),
            Oshi(name: "推し3", mainImageName: "sparkles", photos: [
                Photo(imageName: "photo.fill", caption: "かっこいい写真1")
            ])
        ]
        return state
    }
}
