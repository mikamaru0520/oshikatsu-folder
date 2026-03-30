//
//  Colors.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// カラーデザイントークン
struct AppColors {
    // MARK: - Primary Colors

    /// メインカラー（ピンク）
    static let primary = Color.pink

    /// メインカラーの薄い版
    static let primaryLight = Color.pink.opacity(0.1)

    /// メインカラーの濃い版
    static let primaryDark = Color(red: 0.8, green: 0.2, blue: 0.4)

    // MARK: - Background Colors

    /// 背景色（システムカラー）
    static let background = Color(UIColor.systemBackground)

    /// セカンダリ背景色
    static let backgroundSecondary = Color(UIColor.secondarySystemBackground)

    // MARK: - Text Colors

    /// プライマリテキストカラー
    static let textPrimary = Color.primary

    /// セカンダリテキストカラー
    static let textSecondary = Color.gray

    /// 白色テキスト
    static let textWhite = Color.white

    // MARK: - Semantic Colors

    /// 成功を表す色
    static let success = Color.green

    /// エラーを表す色
    static let error = Color.red

    /// 警告を表す色
    static let warning = Color.orange

    /// 情報を表す色
    static let info = Color.blue

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
