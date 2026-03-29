# Commit Command

変更をgitにコミットしてください。

## 絵文字プレフィックス
変更内容に応じて、以下の絵文字をコミットメッセージの先頭に付けてください：
- 🎉 初めてのコミット（Initial Commit）
- 🔖 バージョンタグ（Version Tag）
- ✨ 新機能（New Feature）
- 🐛 バグ修正（Bugfix）
- ♻️ リファクタリング（Refactoring）
- 📚 ドキュメント（Documentation）
- 🎨 デザインUI/UX（Accessibility）
- 🐎 パフォーマンス（Performance）
- 🔧 ツール（Tooling）
- 🚨 テスト（Tests）
- 💩 非推奨追加（Deprecation）
- 🗑️ 削除（Removal）
- 🚧 WIP（Work In Progress）

## コミットメッセージ形式
コミットメッセージは以下の形式で作成してください：
```
絵文字 本文

説明文（必要に応じて）
```

例：
```
✨ カルーセルビューと詳細画面を追加

推しの写真をカルーセル形式で表示し、タップで詳細画面に遷移する機能を実装
```

## 手順
1. git statusで変更を確認
2. git diffで変更内容を確認
3. 変更内容を分析して適切な絵文字プレフィックスを選択
4. シンプルで明確なコミットメッセージを作成（Claude Codeの署名は含めない）
5. 関連ファイルをgit addで追加
6. コミットを作成
7. git statusでコミットが成功したことを確認
