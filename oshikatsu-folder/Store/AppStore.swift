//
//  AppStore.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation
import Combine

/// MVI パターンの Store
/// Intent を受け取り、State を更新する
@MainActor
class AppStore: ObservableObject {
    @Published private(set) var state: AppState = AppState()

    /// Intent を処理して状態を更新
    func send(_ intent: AppIntent) {
        switch intent {
        case .idle:
            break
        }
    }

    /// 状態を直接更新するためのプライベートメソッド
    private func updateState(_ update: (inout AppState) -> Void) {
        var newState = state
        update(&newState)
        state = newState
    }
}
