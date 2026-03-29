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
    @Published private(set) var state: AppState

    init(initialState: AppState = AppState()) {
        self.state = initialState
    }

    /// Intent を処理して状態を更新
    func send(_ intent: AppIntent) {
        switch intent {
        case .idle:
            break
        case .selectOshi(let oshi):
            updateState { state in
                state.selectedOshi = oshi
            }
        case .deselectOshi:
            updateState { state in
                state.selectedOshi = nil
            }
        case .addOshi(let name, let mainImageName, let imageType):
            updateState { state in
                let newOshi = Oshi(name: name, mainImageName: mainImageName, imageType: imageType, photos: [])
                state.oshiList.append(newOshi)
            }
        }
    }

    /// 状態を直接更新するためのプライベートメソッド
    private func updateState(_ update: (inout AppState) -> Void) {
        var newState = state
        update(&newState)
        state = newState
    }
}
