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
    @State private var showingPhotoAddSheet = false

    var body: some View {
        ZStack {
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
                .padding(.bottom, 120) // フローティングボタン分のスペース確保
            }

            // フローティングアクションボタン
            VStack {
                Spacer()

                Button(action: {
                    showingPhotoAddSheet = true
                }) {
                    HStack(spacing: AppSpacing.sm) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppColors.textWhite)

                        Text("写真を追加")
                            .font(AppTypography.headline())
                            .foregroundColor(AppColors.textWhite)
                    }
                    .padding(.horizontal, AppSpacing.xl)
                    .padding(.vertical, AppSpacing.md)
                    .background(AppColors.primary)
                    .cornerRadius(AppShape.cornerRadiusXl)
                    .heavyShadow(radius: 20, y: 10)
                }
                .padding(.bottom, AppSpacing.xxl)
            }
        }
        .navigationTitle(oshi.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingPhotoAddSheet) {
            // TODO: 写真追加画面を実装
            Text("写真追加画面（未実装）")
        }
    }
}

#Preview {
    @Previewable @State var sampleOshi = Oshi(name: "Sample Oshi", mainImageName: "star.fill", imageType: .icon)

    NavigationStack {
        OshiDetailView(oshi: sampleOshi)
    }
}
