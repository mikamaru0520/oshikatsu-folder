//
//  DSGlassContainer.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/31.
//

import SwiftUI

/// デザインシステムのグラスモーフィズムコンテナコンポーネント
struct DSGlassContainer<Content: View>: View {
    let content: Content
    let padding: CGFloat
    let cornerRadius: CGFloat
    let intensity: DSGlassIntensity

    init(
        padding: CGFloat = AppSpacing.md,
        cornerRadius: CGFloat = AppShape.cornerRadiusMd,
        intensity: DSGlassIntensity = .medium,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.intensity = intensity
    }

    var body: some View {
        content
            .padding(padding)
            .background(
                ZStack {
                    // ベースのマテリアル
                    Rectangle()
                        .fill(intensity.materialStyle)

                    // グラデーションオーバーレイ
                    LinearGradient(
                        colors: intensity.gradientColors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .blendMode(.overlay)
                }
            )
            .cornerRadius(cornerRadius)
    }
}

// MARK: - Glass Intensity

enum DSGlassIntensity {
    case light
    case medium
    case heavy

    var materialStyle: Material {
        switch self {
        case .light:
            return .ultraThinMaterial
        case .medium:
            return .thinMaterial
        case .heavy:
            return .regularMaterial
        }
    }

    var gradientColors: [Color] {
        switch self {
        case .light:
            return [
                Color.white.opacity(0.9),
                Color.white.opacity(0.5)
            ]
        case .medium:
            return [
                Color.white.opacity(0.7),
                Color.white.opacity(0.3)
            ]
        case .heavy:
            return [
                Color.white.opacity(0.5),
                Color.white.opacity(0.2)
            ]
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        // 背景画像
        LinearGradient(
            colors: [AppColors.primary, AppColors.primaryLight],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()

        VStack(spacing: AppSpacing.xl) {
            DSGlassContainer(intensity: .light) {
                VStack(spacing: AppSpacing.sm) {
                    Text("Light Glass")
                        .font(AppTypography.title2())
                    Text("軽いグラスモーフィズム効果")
                        .font(AppTypography.caption())
                        .foregroundColor(AppColors.textSecondary)
                }
            }

            DSGlassContainer(intensity: .medium) {
                VStack(spacing: AppSpacing.sm) {
                    Text("Medium Glass")
                        .font(AppTypography.title2())
                    Text("中程度のグラスモーフィズム効果")
                        .font(AppTypography.caption())
                        .foregroundColor(AppColors.textSecondary)
                }
            }

            DSGlassContainer(intensity: .heavy) {
                VStack(spacing: AppSpacing.sm) {
                    Text("Heavy Glass")
                        .font(AppTypography.title2())
                    Text("強いグラスモーフィズム効果")
                        .font(AppTypography.caption())
                        .foregroundColor(AppColors.textSecondary)
                }
            }
        }
        .padding()
    }
}
