//
//  BottomMenuBar.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// フローティングアクションボタン付き下部メニューバー
struct BottomMenuBar: View {
    let onRegisterTap: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            // 下部バー（背景のみ）
            DSGlassContainer(padding: 0, cornerRadius: 0, intensity: .medium) {
                HStack {
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

            // フローティングアクションボタン
            Button(action: onRegisterTap) {
                HStack(spacing: AppSpacing.sm) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(AppColors.textWhite)

                    Text("推しを登録")
                        .font(AppTypography.headline())
                        .foregroundColor(AppColors.textWhite)
                }
                .padding(.horizontal, AppSpacing.xl)
                .padding(.vertical, AppSpacing.md)
                .background(AppColors.primary)
                .cornerRadius(AppShape.cornerRadiusXl)
                .mediumShadow(radius: 15, y: 8)
            }
            .offset(y: -20) // ボタンを上に浮かせる
        }
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
