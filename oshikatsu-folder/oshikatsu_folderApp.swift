//
//  oshikatsu_folderApp.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI
import SwiftData

@main
struct oshikatsu_folderApp: App {
    let modelContainer: ModelContainer
    @StateObject private var store: AppStore

    init() {
        do {
            // SwiftDataのModelContainerを作成
            let container = try ModelContainer(for: Oshi.self, Photo.self)
            modelContainer = container

            // AppStoreを作成
            let context = ModelContext(container)
            _store = StateObject(wrappedValue: AppStore(modelContext: context))
        } catch {
            fatalError("ModelContainerの作成に失敗しました: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
        .modelContainer(modelContainer)
    }
}
