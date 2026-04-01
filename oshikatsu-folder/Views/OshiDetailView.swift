//
//  OshiDetailView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI
import SwiftData

/// 推しの詳細画面
struct OshiDetailView: View {
    @EnvironmentObject var store: AppStore
    let oshi: Oshi

    var body: some View {
        ScrollView {
            VStack(spacing: AppSpacing.xl) {
                // ヘッダー
                VStack(spacing: AppSpacing.sm) {
                    if oshi.imageType == .photo, let image = ImageManager.loadImage(fileName: oshi.mainImageName) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: AppShape.cornerRadiusLg))
                    } else {
                        Image(systemName: oshi.mainImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(AppColors.primary)
                    }

                    Text(oshi.name)
                        .font(AppTypography.largeTitle())
                        .foregroundColor(AppColors.textPrimary)

                    Text("\(oshi.photos.count)枚の写真")
                        .font(AppTypography.subheadline())
                        .foregroundColor(AppColors.textSecondary)
                }
                .padding(.top, AppSpacing.lg)

                // フォトギャラリー
                if oshi.photos.isEmpty {
                    VStack(spacing: AppSpacing.lg) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 60))
                            .foregroundColor(AppColors.textSecondary)
                        Text("まだ写真が登録されていません")
                            .foregroundColor(AppColors.textSecondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, AppSpacing.xxxl)
                } else {
                    PhotoGalleryView(photos: oshi.photos)
                }
            }
            .padding(AppSpacing.lg)
        }
        .navigationTitle(oshi.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var sampleOshi = Oshi(name: "Sample Oshi", mainImageName: "star.fill", imageType: .icon)

    NavigationStack {
        OshiDetailView(oshi: sampleOshi)
    }
}
