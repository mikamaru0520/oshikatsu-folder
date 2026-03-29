//
//  ContentView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: AppStore
    @State private var showingRegisterSheet = false

    var body: some View {
        NavigationStack {
            ZStack {
                // メインコンテンツ
                VStack(spacing: 0) {
                    // カルーセル
                    OshiCarouselView(
                        oshiList: store.state.oshiList,
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
            .navigationDestination(item: Binding(
                get: { store.state.selectedOshi },
                set: { newValue in
                    if newValue == nil {
                        store.send(.deselectOshi)
                    }
                }
            )) { oshi in
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
    ContentView()
        .environmentObject(AppStore(initialState: AppState.preview))
}
