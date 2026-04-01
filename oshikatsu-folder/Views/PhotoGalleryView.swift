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
        GridItem(.flexible(), spacing: AppSpacing.sm),
        GridItem(.flexible(), spacing: AppSpacing.sm),
        GridItem(.flexible(), spacing: AppSpacing.sm)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.lg) {
            Text("フォトギャラリー")
                .font(AppTypography.title2())
                .foregroundColor(AppColors.textPrimary)
                .padding(.horizontal, AppSpacing.lg)

            LazyVGrid(columns: columns, spacing: AppSpacing.sm) {
                ForEach(photos) { photo in
                    PhotoItemView(photo: photo)
                }
            }
            .padding(.horizontal, AppSpacing.lg)
        }
    }
}

/// 個別のフォトアイテム
struct PhotoItemView: View {
    let photo: Photo

    var body: some View {
        VStack(spacing: AppSpacing.xs) {
            // 写真のサムネイル
            Image(systemName: photo.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(AppColors.primary)
                .padding(AppSpacing.md)
                .background(
                    RoundedRectangle(cornerRadius: AppShape.cornerRadiusMd)
                        .fill(AppColors.primaryLight)
                )

            // キャプション
            if let caption = photo.caption {
                Text(caption)
                    .font(AppTypography.caption())
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(AppColors.textSecondary)
            }

            // 日付
            Text(photo.date, style: .date)
                .font(AppTypography.caption())
                .foregroundColor(AppColors.textSecondary)
        }
    }
}

#Preview {
    // サンプルデータ
    let samplePhoto1 = Photo(imageName: "photo.fill", caption: "Sample 1")
    let samplePhoto2 = Photo(imageName: "camera.fill", caption: "Sample 2")

    ScrollView {
        PhotoGalleryView(photos: [samplePhoto1, samplePhoto2])
    }
}
