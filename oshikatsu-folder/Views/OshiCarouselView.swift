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
            VStack(spacing: 20) {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                Text("推しを登録してください")
                    .font(.headline)
                    .foregroundColor(.gray)
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
                    HStack(spacing: 8) {
                        ForEach(0..<oshiList.count, id: \.self) { index in
                            Circle()
                                .fill(currentIndex == index ? Color.pink : Color.gray.opacity(0.3))
                                .frame(width: 8, height: 8)
                                .animation(.easeInOut(duration: 0.2), value: currentIndex)
                        }
                    }
                    .padding(.vertical, 8)
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
                        Color.pink.opacity(0.1)

                        Image(systemName: oshi.mainImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geometry.size.width * 0.5, 250))
                            .foregroundColor(.pink)
                    }
                }

                // 下部にテキスト情報をオーバーレイ
                VStack(spacing: 8) {
                    Text(oshi.name)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2)

                    Text("\(oshi.photos.count)枚の写真")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 1)
                }
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 200)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    OshiCarouselView(
        oshiList: AppState.preview.oshiList,
        onTap: { _ in }
    )
}
