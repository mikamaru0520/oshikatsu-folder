# Apple Human Interface Guidelines (HIG) 準拠デザインシステム

このドキュメントは、oshikatsu-folderアプリのデザインシステムがAppleのHuman Interface Guidelinesにどのように準拠しているかを説明します。

## 参考資料
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines)
- [iOS Design Themes](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)

---

## 1. スペーシング（Spacing）

### 8ptグリッドシステム
HIGでは、8ptベースのグリッドシステムを推奨しています。これにより、すべてのデバイスで一貫したレイアウトが実現できます。

```swift
// oshikatsu-folder/DesignSystem/Spacing.swift

AppSpacing.xxxs  // 4pt  - 細かい調整用
AppSpacing.xxs   // 8pt
AppSpacing.xs    // 8pt
AppSpacing.sm    // 16pt
AppSpacing.md    // 16pt
AppSpacing.lg    // 24pt
AppSpacing.xl    // 32pt
AppSpacing.xxl   // 40pt
AppSpacing.xxxl  // 48pt
AppSpacing.huge  // 64pt
```

### 画面マージン
HIGでは、画面端からのマージンは16-20ptを推奨しています。

```swift
AppSpacing.screenEdge  // 16pt（画面端のパディング）
```

---

## 2. タップターゲット（Touch Targets）

### 最小タップターゲットサイズ
HIGでは、**最小44x44pt**のタップターゲットを推奨しています。

```swift
AppSpacing.minTapTarget           // 44pt（HIG最小値）
AppSpacing.recommendedTapTarget   // 48pt（推奨値）
AppSpacing.standardRowHeight      // 44pt（リスト行の標準高さ）
```

### 適用例
```swift
Button("タップ") {
    // アクション
}
.frame(minWidth: AppSpacing.minTapTarget,
       minHeight: AppSpacing.minTapTarget)
```

---

## 3. カラー（Colors）

### システムカラーの使用
HIGでは、ダークモード対応のためにシステムカラーの使用を強く推奨しています。

#### 背景色
```swift
AppColors.background              // systemBackground
AppColors.backgroundSecondary     // secondarySystemBackground
AppColors.backgroundTertiary      // tertiarySystemBackground
AppColors.backgroundGrouped       // systemGroupedBackground
```

#### テキスト色
```swift
AppColors.textPrimary     // label（ダークモード対応）
AppColors.textSecondary   // secondaryLabel
AppColors.textTertiary    // tertiaryLabel
AppColors.textQuaternary  // quaternaryLabel
```

#### セマンティックカラー
```swift
AppColors.success   // systemGreen
AppColors.error     // systemRed
AppColors.warning   // systemOrange
AppColors.info      // systemBlue
```

---

## 4. タイポグラフィ（Typography）

### Dynamic Type対応
HIGでは、アクセシビリティのためにDynamic Typeの使用を推奨しています。

```swift
AppTypography.largeTitle()   // 32pt
AppTypography.title1()       // 28pt
AppTypography.title2()       // 24pt
AppTypography.title3()       // 20pt
AppTypography.headline()     // 17pt（太字）
AppTypography.body()         // 16pt
AppTypography.subheadline()  // 15pt
AppTypography.caption()      // 12pt
```

---

## 5. ナビゲーション＆レイアウト

### 標準サイズ
```swift
AppSpacing.navigationBarHeight    // 44pt
AppSpacing.tabBarHeight           // 49pt
AppSpacing.safeAreaTopMargin      // 20pt（ノッチ考慮）
AppSpacing.safeAreaBottomMargin   // 34pt（ホームインジケーター考慮）
```

### セーフエリア
HIGでは、セーフエリアを尊重することを推奨しています。SwiftUIでは自動的に処理されますが、カスタムレイアウトでは考慮が必要です。

```swift
VStack {
    // コンテンツ
}
.padding(.horizontal, AppSpacing.screenEdge)
.safeAreaInset(edge: .bottom) {
    // 下部のカスタムコンテンツ
}
```

---

## 6. インタラクション

### フィードバック
HIGでは、ユーザーのアクションに対して即座にフィードバックを提供することを推奨しています。

- **視覚的フィードバック**: ボタンの色変化、アニメーション
- **触覚的フィードバック**: Haptic Feedback（適切な場合）
- **音声フィードバック**: システムサウンド（適切な場合）

---

## 7. アクセシビリティ

### コントラスト比
HIGでは、WCAG AAレベル以上のコントラスト比を推奨しています。

- **通常テキスト**: 最低4.5:1
- **大きいテキスト**: 最低3:1

システムカラーを使用することで、自動的にこれらの基準を満たします。

### VoiceOver対応
```swift
Button("削除") {
    // アクション
}
.accessibilityLabel("アイテムを削除")
.accessibilityHint("ダブルタップで削除します")
```

---

## 8. コンポーネントガイドライン

### DSButton
```swift
// プライマリボタン（最小44x44pt）
DSButton("保存", style: .primary) {
    // アクション
}

// セカンダリボタン
DSButton("キャンセル", style: .secondary) {
    // アクション
}
```

### DSTextField
```swift
// 最小44ptの高さを確保
DSTextField("名前を入力", text: $name, icon: "person.fill")
```

### DSCard
```swift
DSCard {
    // カードコンテンツ
    // 内部パディングは自動的に適用される
}
```

---

## 9. ダークモード対応

システムカラーを使用することで、自動的にダークモードに対応します。

```swift
// ライトモード/ダークモードで自動的に色が変わる
Text("こんにちは")
    .foregroundColor(AppColors.textPrimary)
    .background(AppColors.background)
```

---

## 10. チェックリスト

新しいUIコンポーネントを作成する際のチェックリスト：

- [ ] タップターゲットは最低44x44ptか？
- [ ] システムカラーを使用しているか？
- [ ] 8ptグリッドに沿っているか？
- [ ] セーフエリアを考慮しているか？
- [ ] ダークモードで確認したか？
- [ ] VoiceOverで操作できるか？
- [ ] Dynamic Typeに対応しているか？
- [ ] 適切なフィードバックを提供しているか？

---

## 参考リンク

- [Apple HIG - Layout](https://developer.apple.com/design/human-interface-guidelines/layout)
- [Apple HIG - Color](https://developer.apple.com/design/human-interface-guidelines/color)
- [Apple HIG - Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
- [Apple HIG - Accessibility](https://developer.apple.com/design/human-interface-guidelines/accessibility)
