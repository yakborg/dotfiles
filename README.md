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
├── CLAUDE.md                        # Claude Code 向け指示書
├── README.md                        # このファイル
├── install.sh                       # セットアップ一括実行スクリプト
├── scripts/
│   └── install-packages.sh          # apt パッケージインストール
├── home/                            # ホームディレクトリの設定ファイル群
│   ├── .zshrc
│   ├── .zshenv
│   └── .config/
│       ├── mise/
│       │   └── config.toml
│       └── sheldon/
│           └── plugins.toml
├── templates/
│   └── CLAUDE.md.tmpl               # 新規プロジェクト用 CLAUDE.md テンプレート
└── policy/
    ├── master/                      # 全エージェント共通ルール
    │   ├── 00-principles.md         # シェル・ランタイム・基本方針
    │   ├── 10-platform-wsl.md       # WSL 固有のパス・設定ルール
    │   └── 20-safety.md             # 安全ルール・禁止操作
    └── agents/                      # エージェント固有ルール
        ├── claude-code.md           # Claude Code 固有の追加ルール
        └── gemini-cli.md            # Gemini CLI 固有の追加ルール
```

## 使い方

各 AI エージェントは対応するポリシーファイルを参照して動作します。

- **Claude Code** → `CLAUDE.md` を自動参照（`policy/master/` + `policy/agents/claude-code.md`）
- **Gemini CLI** → `~/.gemini/GEMINI.md` に `policy/master/` + `policy/agents/gemini-cli.md` の内容を反映

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

### 3. AIエージェント設定のシンボリックリンクを作成
```bash
ln -s ~/dotfiles/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/dotfiles/GEMINI.md ~/.gemini/GEMINI.md
```

### 前提条件
- `~/.claude/` が存在すること（Claude Code を一度起動すれば自動作成される）
- `~/.gemini/` が存在すること（Gemini CLI を一度起動すれば自動作成される）
- `~/.gemini/GEMINI.md` が空または存在しない場合は削除してからリンクを作成する
```bash
rm ~/.gemini/GEMINI.md
```

### 注意事項
- `~/.secrets/env` はdotfiles管理外。新マシンでは別途手動で作成が必要
