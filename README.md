# dotfiles

`/home/noda` 環境の設定管理方針ドキュメント。

## 環境概要

| 項目 | 内容 |
|---|---|
| OS | Ubuntu on WSL2 |
| シェル | zsh |
| ランタイムマネージャー | mise |
| プラグインマネージャー | sheldon |
| プロンプト | starship |

### mise 管理ツール

- deno, neovim, node, python（すべて latest）

### sheldon プラグイン

- zsh-defer, zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions, ohmyzsh/git

## ディレクトリ構成

```
dotfiles/
├── README.md                        # このファイル
├── install.sh                       # セットアップ一括実行スクリプト
├── scripts/
│   └── install-packages.sh          # apt パッケージインストール
└── home/                            # ホームディレクトリの設定ファイル群
    ├── .zshrc
    ├── .zshenv
    └── .config/
        ├── mise/
        │   └── config.toml
        └── sheldon/
            └── plugins.toml
```

## AIポリシー

AI エージェントへの指示ポリシーは [yakborg/ai-policy](https://github.com/yakborg/ai-policy) で管理

## セットアップ手順（新しいマシン）

### 1. リポジトリをクローン
```bash
git clone git@github.com:yakborg/dotfiles.git ~/dotfiles
```

### 2. zsh/mise/sheldon 設定のシンボリックリンクを一括作成
```bash
./install.sh
```

`home/` 以下のファイルを `~/` に一括でシンボリックリンクします（`.zshrc`, `.zshenv`, `mise/config.toml`, `sheldon/plugins.toml`）。

### 注意事項
- `~/.secrets/env` はdotfiles管理外。新マシンでは別途手動で作成が必要
