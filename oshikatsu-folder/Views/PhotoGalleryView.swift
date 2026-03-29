//
//  PhotoGalleryView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// フォトギャラリー表示ビュー
struct PhotoGalleryView: View {
    let photos: [Photo]

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("フォトギャラリー")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(photos) { photo in
                    PhotoItemView(photo: photo)
                }
            }
            .padding(.horizontal)
        }
    }
}

/// 個別のフォトアイテム
struct PhotoItemView: View {
    let photo: Photo

    var body: some View {
        VStack(spacing: 8) {
            // 写真のサムネイル
            Image(systemName: photo.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.pink)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.pink.opacity(0.1))
                )

            // キャプション
            if let caption = photo.caption {
                Text(caption)
                    .font(.caption2)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }

            // 日付
            Text(photo.date, style: .date)
                .font(.caption2)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ScrollView {
        PhotoGalleryView(photos: AppState.preview.oshiList[0].photos)
    }
}
