//
//  ContentView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: AppStore

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // タイトル
                VStack(spacing: 8) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.pink)
                    Text("推し活アプリ")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)

                // カルーセル
                OshiCarouselView(
                    oshiList: store.state.oshiList,
                    onTap: { oshi in
                        store.send(.selectOshi(oshi))
                    }
                )

                Spacer()
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
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStore(initialState: AppState.preview))
}
