//
//  BottomMenuBar.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// フローティングアクションボタン
struct BottomMenuBar: View {
    let onRegisterTap: () -> Void

    var body: some View {
        VStack {
            Spacer()

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
                .heavyShadow(radius: 20, y: 10)
            }
            .padding(.bottom, AppSpacing.xxl) // セーフエリアから適切な距離を確保
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
