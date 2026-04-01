//
//  Colors.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// カラーデザイントークン（Apple HIG準拠）
struct AppColors {
    // MARK: - Primary Colors

    /// メインカラー（ピンク）
    static let primary = Color.pink

    /// メインカラーの薄い版
    static let primaryLight = Color.pink.opacity(0.1)

    /// メインカラーの濃い版
    static let primaryDark = Color(red: 0.8, green: 0.2, blue: 0.4)

    // MARK: - HIG System Background Colors

    /// 背景色（システムカラー - ダークモード対応）
    static let background = Color(UIColor.systemBackground)

    /// セカンダリ背景色（カード、グループ化された要素）
    static let backgroundSecondary = Color(UIColor.secondarySystemBackground)

    /// ターシャリ背景色（さらにグループ化された要素）
    static let backgroundTertiary = Color(UIColor.tertiarySystemBackground)

    /// グループ化された背景色（テーブルビューなど）
    static let backgroundGrouped = Color(UIColor.systemGroupedBackground)

    /// セカンダリグループ化された背景色
    static let backgroundGroupedSecondary = Color(UIColor.secondarySystemGroupedBackground)

    // MARK: - HIG System Text Colors

    /// プライマリテキストカラー（システムカラー - ダークモード対応）
    static let textPrimary = Color(UIColor.label)

    /// セカンダリテキストカラー（補助的な情報）
    static let textSecondary = Color(UIColor.secondaryLabel)

    /// ターシャリテキストカラー（さらに補助的な情報）
    static let textTertiary = Color(UIColor.tertiaryLabel)

    /// 非活性テキストカラー
    static let textQuaternary = Color(UIColor.quaternaryLabel)

    /// 白色テキスト（オーバーレイ用）
    static let textWhite = Color.white

    /// プレースホルダーテキストカラー
    static let textPlaceholder = Color(UIColor.placeholderText)

    // MARK: - HIG Semantic Colors

    /// 成功を表す色（システムグリーン）
    static let success = Color(UIColor.systemGreen)

    /// エラーを表す色（システムレッド）
    static let error = Color(UIColor.systemRed)

    /// 警告を表す色（システムオレンジ）
    static let warning = Color(UIColor.systemOrange)

    /// 情報を表す色（システムブルー）
    static let info = Color(UIColor.systemBlue)

    // MARK: - HIG UI Element Colors

    /// セパレーター（区切り線）
    static let separator = Color(UIColor.separator)

    /// 不透明なセパレーター
    static let separatorOpaque = Color(UIColor.opaqueSeparator)

    /// リンクカラー
    static let link = Color(UIColor.link)

    /// フィルカラー（ボタンやプログレスバーなど）
    static let fill = Color(UIColor.systemFill)

    /// セカンダリフィルカラー
    static let fillSecondary = Color(UIColor.secondarySystemFill)

    /// ターシャリフィルカラー
    static let fillTertiary = Color(UIColor.tertiarySystemFill)

    // MARK: - Overlay Colors

    /// グラデーションオーバーレイ（下部）
    static let gradientOverlay = LinearGradient(
        colors: [.clear, .black.opacity(0.6)],
        startPoint: .top,
        endPoint: .bottom
    )

    /// グラスモーフィズム用の白グラデーション
    static let glassGradient = LinearGradient(
        colors: [
            Color.white.opacity(0.7),
            Color.white.opacity(0.3)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
}
