//
//  DSTextField.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/31.
//

import SwiftUI

/// デザインシステムのテキストフィールドコンポーネント
struct DSTextField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String?
    let style: DSTextFieldStyle

    init(
        _ placeholder: String,
        text: Binding<String>,
        icon: String? = nil,
        style: DSTextFieldStyle = .default
    ) {
        self.placeholder = placeholder
        self._text = text
        self.icon = icon
        self.style = style
    }

    var body: some View {
        HStack(spacing: AppSpacing.sm) {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(AppColors.textSecondary)
                    .frame(width: 20)
            }

            TextField(placeholder, text: $text)
                .font(AppTypography.body())
                .foregroundColor(AppColors.textPrimary)
        }
        .padding(AppSpacing.md)
        .background(style.backgroundColor)
        .cornerRadius(AppShape.cornerRadiusMd)
        .overlay(
            RoundedRectangle(cornerRadius: AppShape.cornerRadiusMd)
                .stroke(style.borderColor, lineWidth: style.borderWidth)
        )
    }
}

// MARK: - TextField Style

enum DSTextFieldStyle {
    case `default`
    case outlined
    case filled

    var backgroundColor: Color {
        switch self {
        case .default:
            return AppColors.background
        case .outlined:
            return .clear
        case .filled:
            return AppColors.backgroundSecondary
        }
    }

    var borderColor: Color {
        switch self {
        case .default:
            return AppColors.textSecondary.opacity(0.3)
        case .outlined:
            return AppColors.primary
        case .filled:
            return .clear
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .default:
            return 1
        case .outlined:
            return 2
        case .filled:
            return 0
        }
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: AppSpacing.lg) {
        DSTextField("名前を入力", text: .constant(""), icon: "person.fill")

        DSTextField("メールアドレス", text: .constant(""), icon: "envelope.fill", style: .outlined)

        DSTextField("メモ", text: .constant("サンプルテキスト"), style: .filled)
    }
    .padding()
    .background(AppColors.backgroundSecondary)
}
