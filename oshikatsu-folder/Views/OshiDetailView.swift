//
//  OshiDetailView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// 推しの詳細画面
struct OshiDetailView: View {
    @EnvironmentObject var store: AppStore
    let oshi: Oshi

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // ヘッダー
                VStack(spacing: 12) {
                    Image(systemName: oshi.mainImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.pink)

                    Text(oshi.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("\(oshi.photos.count)枚の写真")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top)

                // フォトギャラリー
                if oshi.photos.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("まだ写真が登録されていません")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 60)
                } else {
                    PhotoGalleryView(photos: oshi.photos)
                }
            }
            .padding()
        }
        .navigationTitle(oshi.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        OshiDetailView(oshi: AppState.preview.oshiList[0])
            .environmentObject(AppStore(initialState: AppState.preview))
    }
}
