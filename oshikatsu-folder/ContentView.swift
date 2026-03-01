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
        VStack {
            Image(systemName: "star.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("推し活アプリ")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppStore())
}
