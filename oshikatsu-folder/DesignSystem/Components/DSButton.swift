//
//  DSButton.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/31.
//

import SwiftUI

/// デザインシステムのボタンコンポーネント
struct DSButton: View {
    let title: String
    let icon: String?
    let style: DSButtonStyle
    let size: DSButtonSize
    let action: () -> Void

    init(
        _ title: String,
        icon: String? = nil,
        style: DSButtonStyle = .primary,
        size: DSButtonSize = .medium,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.size = size
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: AppSpacing.xs) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: size.iconSize))
                }
                Text(title)
                    .font(size.font)
            }
            .foregroundColor(style.foregroundColor)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalPadding)
            .frame(maxWidth: size.isFullWidth ? .infinity : nil)
            .background(style.backgroundColor)
            .cornerRadius(AppShape.cornerRadiusMd)
        }
    }
}

// MARK: - Button Style

enum DSButtonStyle {
    case primary
    case secondary
    case outlined
    case text

    var backgroundColor: Color {
        switch self {
        case .primary:
            return AppColors.primary
        case .secondary:
            return AppColors.primaryLight
        case .outlined, .text:
            return .clear
        }
    }

    var foregroundColor: Color {
        switch self {
        case .primary:
            return AppColors.textWhite
        case .secondary, .outlined, .text:
            return AppColors.primary
        }
    }
}

// MARK: - Button Size

enum DSButtonSize {
    case small
    case medium
    case large

    var font: Font {
        switch self {
        case .small:
            return AppTypography.caption()
        case .medium:
            return AppTypography.body()
        case .large:
            return AppTypography.title3()
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .small:
            return 14
        case .medium:
            return 18
        case .large:
            return 22
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .small:
            return AppSpacing.sm
        case .medium:
            return AppSpacing.lg
        case .large:
            return AppSpacing.xl
        }
    }

    var verticalPadding: CGFloat {
        switch self {
        case .small:
            return AppSpacing.xs
        case .medium:
            return AppSpacing.sm
        case .large:
            return AppSpacing.md
        }
    }

    var isFullWidth: Bool {
        self == .large
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: AppSpacing.md) {
        DSButton("Primary Button", icon: "star.fill", style: .primary) {
            print("Primary tapped")
        }

        DSButton("Secondary Button", icon: "heart.fill", style: .secondary) {
            print("Secondary tapped")
        }

        DSButton("Small Button", style: .primary, size: .small) {
            print("Small tapped")
        }

        DSButton("Large Button", icon: "plus.circle", style: .primary, size: .large) {
            print("Large tapped")
        }
    }
    .padding()
}
