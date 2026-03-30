//
//  Spacing.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// スペーシングデザイントークン
struct AppSpacing {
    /// 極小（4pt）
    static let xxs: CGFloat = 4

    /// 超小（8pt）
    static let xs: CGFloat = 8

    /// 小（12pt）
    static let sm: CGFloat = 12

    /// 中（16pt）
    static let md: CGFloat = 16

    /// 大（20pt）
    static let lg: CGFloat = 20

    /// 特大（24pt）
    static let xl: CGFloat = 24

    /// 超特大（32pt）
    static let xxl: CGFloat = 32

    /// 巨大（40pt）
    static let xxxl: CGFloat = 40

    /// 超巨大（48pt）
    static let huge: CGFloat = 48

    // MARK: - Specific Use Cases

    /// カード内のパディング
    static let cardPadding: CGFloat = lg

    /// 画面端のパディング
    static let screenEdge: CGFloat = lg

    /// セクション間のスペース
    static let sectionSpacing: CGFloat = xxl

    /// アイテム間のスペース
    static let itemSpacing: CGFloat = md
}
