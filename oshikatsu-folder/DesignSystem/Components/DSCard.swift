//
//  DSCard.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/31.
//

import SwiftUI

/// デザインシステムのカードコンポーネント
struct DSCard<Content: View>: View {
    let content: Content
    let padding: CGFloat
    let cornerRadius: CGFloat
    let hasShadow: Bool

    init(
        padding: CGFloat = AppSpacing.md,
        cornerRadius: CGFloat = AppShape.cornerRadiusLg,
        hasShadow: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.hasShadow = hasShadow
    }

    var body: some View {
        content
            .padding(padding)
            .background(AppColors.background)
            .cornerRadius(cornerRadius)
            .modifier(ConditionalShadow(hasShadow: hasShadow))
    }
}

// MARK: - Conditional Shadow Modifier

struct ConditionalShadow: ViewModifier {
    let hasShadow: Bool

    func body(content: Content) -> some View {
        if hasShadow {
            content.mediumShadow()
        } else {
            content
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: AppSpacing.lg) {
        DSCard {
            VStack(alignment: .leading, spacing: AppSpacing.sm) {
                Text("カードタイトル")
                    .font(AppTypography.title2())
                Text("カードの説明文がここに入ります。")
                    .font(AppTypography.body())
                    .foregroundColor(AppColors.textSecondary)
            }
        }

        DSCard(hasShadow: false) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(AppColors.primary)
                Text("シャドウなしカード")
                    .font(AppTypography.body())
            }
        }
    }
    .padding()
    .background(AppColors.backgroundSecondary)
}
