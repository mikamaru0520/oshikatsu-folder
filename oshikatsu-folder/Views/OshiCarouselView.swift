//
//  OshiCarouselView.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// 推しの写真をカルーセル形式で表示するビュー
struct OshiCarouselView: View {
    let oshiList: [Oshi]
    let onTap: (Oshi) -> Void
    @State private var currentIndex: Int = 0

    var body: some View {
        if oshiList.isEmpty {
            // 推しが登録されていない場合
            VStack(spacing: AppSpacing.lg) {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(size: 80))
                    .foregroundColor(AppColors.textSecondary)
                Text("推しを登録してください")
                    .font(.headline)
                    .foregroundColor(AppColors.textSecondary)
            }
            .frame(height: 400)
        } else {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // カルーセル表示
                    TabView(selection: $currentIndex) {
                        ForEach(Array(oshiList.enumerated()), id: \.element.id) { index, oshi in
                            OshiCardView(oshi: oshi)
                                .onTapGesture {
                                    onTap(oshi)
                                }
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never)) // デフォルトのインジケーターを非表示
                    .frame(height: geometry.size.height - 40)

                    // カスタムページインジケーター
                    HStack(spacing: AppSpacing.xs) {
                        ForEach(0..<oshiList.count, id: \.self) { index in
                            Circle()
                                .fill(currentIndex == index ? AppColors.primary : AppColors.textSecondary.opacity(0.3))
                                .frame(width: AppSpacing.xs, height: AppSpacing.xs)
                                .animation(.easeInOut(duration: 0.2), value: currentIndex)
                        }
                    }
                    .padding(.vertical, AppSpacing.xs)
                    .frame(height: 40)
                }
            }
        }
    }
}

/// 個別の推しカード
struct OshiCardView: View {
    let oshi: Oshi

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // メイン画像（画面全体）
                if oshi.imageType == .photo, let image = ImageManager.loadImage(fileName: oshi.mainImageName) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                } else {
                    // アイコンの場合は背景色付きで表示
                    ZStack {
                        AppColors.primaryLight

                        Image(systemName: oshi.mainImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width * 0.5, 250))
                            .foregroundColor(AppColors.primary)
                    }
                }

                // 下部にテキスト情報をオーバーレイ
                VStack(spacing: AppSpacing.xs) {
                    Text(oshi.name)
                        .font(AppTypography.hero())
                        .foregroundColor(AppColors.textWhite)
                        .textShadow()

                    Text("\(oshi.photos.count)枚の写真")
                        .font(AppTypography.title3())
                        .foregroundColor(AppColors.textWhite.opacity(0.9))
                        .textShadow()
                }
                .padding(.bottom, AppSpacing.xxxl)
                .frame(maxWidth: .infinity)
                .background(
                    AppColors.gradientOverlay
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    // サンプルデータ
    let sampleOshi1 = Oshi(name: "Sample 1", mainImageName: "star.fill", imageType: .icon)
    let sampleOshi2 = Oshi(name: "Sample 2", mainImageName: "heart.fill", imageType: .icon)

    OshiCarouselView(
        oshiList: [sampleOshi1, sampleOshi2],
        onTap: { _ in }
    )
}
