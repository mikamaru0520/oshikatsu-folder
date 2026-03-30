//
//  Shape.swift
//  oshikatsu-folder
//
//  Created by maro on 2026/03/01.
//

import SwiftUI

/// 角丸・シャドウデザイントークン
struct AppShape {
    // MARK: - Corner Radius

    /// 小さい角丸（8pt）
    static let cornerRadiusSm: CGFloat = 8

    /// 中サイズ角丸（12pt）
    static let cornerRadiusMd: CGFloat = 12

    /// 大きい角丸（20pt）
    static let cornerRadiusLg: CGFloat = 20

    /// 特大角丸（30pt）
    static let cornerRadiusXl: CGFloat = 30

    // MARK: - Shadow

    /// 軽いシャドウ
    static func lightShadow(radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        EmptyView().modifier(ShadowModifier(
            color: .black.opacity(0.1),
            radius: radius,
            x: x,
            y: y
        ))
    }

    /// 中程度のシャドウ
    static func mediumShadow(radius: CGFloat = 10, x: CGFloat = 0, y: CGFloat = 5) -> some View {
        EmptyView().modifier(ShadowModifier(
            color: .black.opacity(0.2),
            radius: radius,
            x: x,
            y: y
        ))
    }

    /// 強いシャドウ
    static func heavyShadow(radius: CGFloat = 15, x: CGFloat = 0, y: CGFloat = 8) -> some View {
        EmptyView().modifier(ShadowModifier(
            color: .black.opacity(0.3),
            radius: radius,
            x: x,
            y: y
        ))
    }
}

// MARK: - Shadow Modifier

struct ShadowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat

    func body(content: Content) -> some View {
        content.shadow(color: color, radius: radius, x: x, y: y)
    }
}

// MARK: - View Extension

extension View {
    /// 軽いシャドウを適用
    func lightShadow(radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        self.shadow(color: .black.opacity(0.1), radius: radius, x: x, y: y)
    }

    /// 中程度のシャドウを適用
    func mediumShadow(radius: CGFloat = 10, x: CGFloat = 0, y: CGFloat = 5) -> some View {
        self.shadow(color: .black.opacity(0.2), radius: radius, x: x, y: y)
    }

    /// 強いシャドウを適用
    func heavyShadow(radius: CGFloat = 15, x: CGFloat = 0, y: CGFloat = 8) -> some View {
        self.shadow(color: .black.opacity(0.3), radius: radius, x: x, y: y)
    }

    /// テキストシャドウを適用
    func textShadow(radius: CGFloat = 3, x: CGFloat = 0, y: CGFloat = 1) -> some View {
        self.shadow(color: .black.opacity(0.5), radius: radius, x: x, y: y)
    }
}
