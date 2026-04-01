//
//  ContentView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Oshi.name) private var oshiList: [Oshi]
    @EnvironmentObject var store: AppStore
    @State private var showingRegisterSheet = false

    var body: some View {
        NavigationStack {
            ZStack {
                // メインコンテンツ
                VStack(spacing: 0) {
                    // カルーセル
                    OshiCarouselView(
                        oshiList: oshiList,
                        onTap: { oshi in
                            store.send(.selectOshi(oshi))
                        }
                    )
                }
                .padding(.top, 20)
                .padding(.bottom, 80) // 下部メニュー分のスペースを確保

                // 下部メニューバー
                VStack {
                    Spacer()
                    BottomMenuBar(onRegisterTap: {
                        showingRegisterSheet = true
                    })
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationDestination(item: $store.selectedOshi) { oshi in
                OshiDetailView(oshi: oshi)
            }
            .sheet(isPresented: $showingRegisterSheet) {
                OshiRegisterView()
                    .environmentObject(store)
            }
        }
    }
}

#Preview {
    @Previewable @State var container: ModelContainer = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Oshi.self, configurations: config)
        return container
    }()

    @Previewable @State var store: AppStore = {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Oshi.self, configurations: config)
        return AppStore(modelContext: ModelContext(container))
    }()

    ContentView()
        .environmentObject(store)
        .modelContainer(container)
}
