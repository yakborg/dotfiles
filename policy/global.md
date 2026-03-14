# Global AI Rules

## 回答スタイル
- 回答は日本語で
- 簡潔に。冗長な説明・過剰な前置きは不要
- 確信のない操作は実行前にユーザーへ確認する

## 環境
- ランタイム: WSL2 Ubuntu / zsh
- バージョン管理: mise（deno / node / python / neovim）
- zshプラグイン: sheldon（zsh-defer / autosuggestions / syntax-highlighting）
- プロンプト: starship

## 禁止事項
- 認証情報・APIキーをファイルや応答に含めない
- ~/.zshrc / ~/.config/mise/config.toml 等の既存設定を無断編集しない
- 破壊的操作（削除・上書き・push）は確認なしに実行しない
