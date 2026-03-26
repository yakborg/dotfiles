# AGENTS.md — dotfiles

## 概要

このリポジトリは WSL2 (Ubuntu) + Windows 11 環境のパーソナル dotfiles を管理します。
このリポジトリで作業するすべての AI エージェント（Codex、Claude Code 等）は以下のルールに従ってください。

---

## 正として扱うべきファイル

- `home/` 配下が dotfile の正（source of truth）です。
- `~/.zshrc` / `~/.zshenv` / `~/.config/mise/config.toml` などのライブパスは `home/` 配下へのシンボリックリンクです。
- **ライブパスを直接編集してはいけません。** 必ず対応する `home/` 配下のファイルを編集してください。

```
# 正しい
home/.zshrc
home/.zshenv
home/.config/mise/config.toml

# 禁止
~/.zshrc
~/.zshenv
~/.config/mise/config.toml
```

---

## シンボリックリンクの検証

変更後は必ずシンボリックリンクが正しく張られているか確認してください。

```sh
ls -la ~/.zshrc ~/.zshenv ~/.config/mise/config.toml
readlink -f ~/.zshrc ~/.zshenv ~/.config/mise/config.toml
```

期待値：各ライブパスが `~/dotfiles/home/` 配下のファイルに解決されること。

---

## Node / mise

- Node は `mise` のみで管理します。
- `home/.config/mise/config.toml` の `[tools]` セクションは `node = "lts"` を維持してください。
- **特定バージョンへの固定（例: `node = "24"`）は禁止します。**
- nvm / fnm / volta などの代替 Node バージョンマネージャを導入しないでください。

変更後の確認コマンド：

```sh
grep -A2 'node' home/.config/mise/config.toml
```

---

## シェル構文の検証

シェルファイルを編集した場合は必ず実行してください。

```sh
zsh -n home/.zshrc
zsh -n home/.zshenv
```

両方ともエラーなしで終了すること。

---

## 触れてはいけないパス

以下のパスは読み取り・変更・検査を一切行ってはいけません。

- `~/.ssh/`
- `~/.gnupg/`
- `~/.secrets`
- このリポジトリで管理されていないファイル全般

---

## 変更スコープ

- タスクに必要な**最小限の変更**のみ行ってください。
- 大規模なリファクタリング、命名規則の変更、ディレクトリ構造の変更は行わないでください。
- 無関係なツールの追加や設定の整理も対象外です。
- スコープ外の変更が必要と判断した場合は、実施前に確認を求めてください。

---

## 動作環境

- このリポジトリは **Windows 11 上の WSL2 (Ubuntu)** で管理しています。
- Codex / Claude Code は **WSL 内で直接起動**します。コマンドを `wsl zsh -ic` でラップしないでください。
- シェル環境: `zsh` + `mise` + `sheldon` + `starship`
- WSL ユーザー名: `noda` / Windows ユーザー名: `tecon`

---

## 変更後の出力フォーマット

1. 調査した内容
2. 変更した内容（unified diff）
3. 検証結果（シンボリックリンク確認・zsh -n・grep 結果）
4. 残課題・懸念事項
