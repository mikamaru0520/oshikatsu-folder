//
//  BottomMenuBar.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// グラスモーフィズムスタイルの下部メニューバー
struct BottomMenuBar: View {
    let onRegisterTap: () -> Void

    var body: some View {
        HStack {
            Spacer()

            // 登録ボタン
            Button(action: onRegisterTap) {
                VStack(spacing: 8) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.pink)

                    Text("推しを登録")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
            }

            Spacer()
        }
        .frame(height: 80)
        .background(
            // グラスモーフィズム効果
            ZStack {
                // ぼかし背景
                Rectangle()
                    .fill(.ultraThinMaterial)

                // グラデーションオーバーレイ
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.7),
                        Color.white.opacity(0.3)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .blendMode(.overlay)
            }
        )
        .overlay(
            // 上部の境界線
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.8),
                            Color.white.opacity(0.2)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1),
            alignment: .top
        )
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

#Preview {
    VStack {
        Spacer()
        BottomMenuBar(onRegisterTap: {
            print("Register tapped")
        })
    }
    .background(
        LinearGradient(
            colors: [.pink.opacity(0.3), .purple.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    )
}
