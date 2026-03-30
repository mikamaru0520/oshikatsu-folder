//
//  Typography.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// タイポグラフィデザイントークン
struct AppTypography {
    // MARK: - Font Sizes

    /// 超大見出し（36pt）
    static let heroSize: CGFloat = 36

    /// 大見出し（32pt）
    static let largeTitle: CGFloat = 32

    /// 見出し1（28pt）
    static let title1: CGFloat = 28

    /// 見出し2（24pt）
    static let title2: CGFloat = 24

    /// 見出し3（20pt）
    static let title3: CGFloat = 20

    /// 本文（16pt）
    static let body: CGFloat = 16

    /// 小さい本文（14pt）
    static let callout: CGFloat = 14

    /// キャプション（12pt）
    static let caption: CGFloat = 12

    // MARK: - Font Weights

    /// 通常
    static let regular: Font.Weight = .regular

    /// 中太
    static let medium: Font.Weight = .medium

    /// 太字
    static let bold: Font.Weight = .bold

    // MARK: - Predefined Styles

    /// ヒーローテキストスタイル
    static func hero(_ weight: Font.Weight = .bold) -> Font {
        .system(size: heroSize, weight: weight)
    }

    /// 大きいタイトルスタイル
    static func largeTitle(_ weight: Font.Weight = .bold) -> Font {
        .system(size: largeTitle, weight: weight)
    }

    /// タイトル1スタイル
    static func title1(_ weight: Font.Weight = .bold) -> Font {
        .system(size: title1, weight: weight)
    }

    /// タイトル2スタイル
    static func title2(_ weight: Font.Weight = .bold) -> Font {
        .system(size: title2, weight: weight)
    }

    /// タイトル3スタイル
    static func title3(_ weight: Font.Weight = .medium) -> Font {
        .system(size: title3, weight: weight)
    }

    /// 本文スタイル
    static func body(_ weight: Font.Weight = .regular) -> Font {
        .system(size: body, weight: weight)
    }

    /// キャプションスタイル
    static func caption(_ weight: Font.Weight = .regular) -> Font {
        .system(size: caption, weight: weight)
    }
}
