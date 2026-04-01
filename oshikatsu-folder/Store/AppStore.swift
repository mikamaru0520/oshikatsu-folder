//
//  AppStore.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import Foundation
import SwiftData
import Combine

/// MVI パターンの Store（SwiftData対応）
/// Intent を受け取り、SwiftDataを更新する
@MainActor
class AppStore: ObservableObject {
    @Published var selectedOshi: Oshi?
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    /// Intent を処理
    func send(_ intent: AppIntent) {
        switch intent {
        case .idle:
            break
        case .selectOshi(let oshi):
            selectedOshi = oshi
        case .deselectOshi:
            selectedOshi = nil
        case .addOshi(let name, let mainImageName, let imageType):
            let newOshi = Oshi(name: name, mainImageName: mainImageName, imageType: imageType, photos: [])
            modelContext.insert(newOshi)
            saveContext()
        }
    }

    /// コンテキストを保存
    private func saveContext() {
        do {
            try modelContext.save()
            print("✅ SwiftDataに保存成功")
        } catch {
            print("❌ SwiftData保存エラー: \(error)")
        }
    }
}
