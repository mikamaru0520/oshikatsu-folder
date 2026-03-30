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
        DSGlassContainer(padding: 0, cornerRadius: 0, intensity: .medium) {
            HStack {
                Spacer()

                // 登録ボタン
                Button(action: onRegisterTap) {
                    VStack(spacing: AppSpacing.xs) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(AppColors.primary)

                        Text("推しを登録")
                            .font(AppTypography.caption())
                            .fontWeight(.medium)
                            .foregroundColor(AppColors.textPrimary)
                    }
                    .padding(.vertical, AppSpacing.sm)
                    .padding(.horizontal, AppSpacing.xl)
                }

                Spacer()
            }
            .frame(height: 80)
        }
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
        .lightShadow(radius: 10, y: -5)
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
