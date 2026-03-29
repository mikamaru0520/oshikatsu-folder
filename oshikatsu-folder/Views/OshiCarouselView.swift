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
            // カルーセル表示
            TabView {
                ForEach(oshiList) { oshi in
                    OshiCardView(oshi: oshi)
                        .onTapGesture {
                            onTap(oshi)
                        }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 400)
        }
    }
}

/// 個別の推しカード
struct OshiCardView: View {
    let oshi: Oshi

    var body: some View {
        VStack(spacing: 16) {
            // メイン画像
            Image(systemName: oshi.mainImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.pink)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink.opacity(0.1))
                )

            // 推し名
            Text(oshi.name)
                .font(.title2)
                .fontWeight(.bold)

            // フォト数
            Text("\(oshi.photos.count)枚の写真")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

#Preview {
    OshiCarouselView(
        oshiList: AppState.preview.oshiList,
        onTap: { _ in }
    )
}
