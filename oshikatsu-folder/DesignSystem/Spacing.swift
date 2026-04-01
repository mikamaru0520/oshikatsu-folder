//
//  Spacing.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// スペーシングデザイントークン（Apple HIG準拠 - 8ptグリッドシステム）
struct AppSpacing {
    /// 極小（4pt）- 細かい調整用
    static let xxxs: CGFloat = 4

    /// 超小（8pt）
    static let xxs: CGFloat = 8

    /// 小（8pt）
    static let xs: CGFloat = 8

    /// 中小（16pt）
    static let sm: CGFloat = 16

    /// 中（16pt）
    static let md: CGFloat = 16

    /// 大（24pt）
    static let lg: CGFloat = 24

    /// 特大（32pt）
    static let xl: CGFloat = 32

    /// 超特大（40pt）
    static let xxl: CGFloat = 40

    /// 巨大（48pt）
    static let xxxl: CGFloat = 48

    /// 超巨大（64pt）
    static let huge: CGFloat = 64

    // MARK: - HIG Specific Use Cases

    /// カード内のパディング
    static let cardPadding: CGFloat = lg

    /// 画面端のパディング（HIG推奨: 16-20pt）
    static let screenEdge: CGFloat = md

    /// セクション間のスペース
    static let sectionSpacing: CGFloat = xxl

    /// アイテム間のスペース
    static let itemSpacing: CGFloat = md

    // MARK: - HIG Interaction Guidelines

    /// 最小タップターゲットサイズ（HIG: 44x44pt）
    static let minTapTarget: CGFloat = 44

    /// 推奨タップターゲットサイズ（HIG: 44x44pt以上）
    static let recommendedTapTarget: CGFloat = 48

    /// リスト行の標準高さ（HIG: 44pt）
    static let standardRowHeight: CGFloat = 44

    // MARK: - HIG Safe Area & Navigation

    /// ナビゲーションバー高さ（標準）
    static let navigationBarHeight: CGFloat = 44

    /// タブバー高さ（標準）
    static let tabBarHeight: CGFloat = 49

    /// セーフエリアトップ余白（ノッチあり端末考慮）
    static let safeAreaTopMargin: CGFloat = 20

    /// セーフエリアボトム余白（ホームインジケーター考慮）
    static let safeAreaBottomMargin: CGFloat = 34
}
