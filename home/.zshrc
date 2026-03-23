# --- Path設定 ---
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# --- mise (言語・ツール管理) ---
# ここでPythonなどのパスが通る
eval "$(mise activate zsh)"

# --- Sheldon (プラグイン管理) ---
# 高速にプラグインを読み込む
eval "$(sheldon source)"

# --- Starship (プロンプト) ---
# 最後に見た目を適用
eval "$(starship init zsh)"

# --- ユーザー設定 (好みで調整) ---
setopt HIST_IGNORE_DUPS   # 履歴の重複を無視
setopt print_eight_bit    # 日本語ファイル名の文字化け防止
alias ls='ls --color=auto' # lsコマンドに色をつける

# --- シークレット読み込み ---
[[ -f ~/.secrets/env/yakborg.secret ]] && source ~/.secrets/env/yakborg.secret
