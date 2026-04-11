# --- Path設定 ---
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# --- SSH agent auto-start (persistent across shells) ---
SSH_ENV="$HOME/.ssh/agent.env"
if [ -f "$SSH_ENV" ]; then
  . "$SSH_ENV" > /dev/null
fi
if ! ssh-add -l > /dev/null 2>&1; then
  ssh-agent -s > "$SSH_ENV"
  chmod 600 "$SSH_ENV"
  . "$SSH_ENV" > /dev/null
  ssh-add ~/.ssh/id_ed25519
fi

# --- mise (言語・ツール管理) ---
eval "$(mise activate zsh)"

# --- Sheldon (プラグイン管理) ---
eval "$(sheldon source)"

# --- Starship (プロンプト) ---
eval "$(starship init zsh)"

# --- ユーザー設定 ---
setopt HIST_IGNORE_DUPS
setopt print_eight_bit
alias ls='ls --color=auto'
alias claude='claude --enable-auto-mode'
alias codex='codex --full-auto'

# --- エディタ ---
export EDITOR=nvim
export VISUAL=nvim

# --- fzf ---
source <(fzf --zsh)

# --- シークレット読み込み ---
[[ -f ~/.secrets/anthropic/anthropic.env ]] && source ~/.secrets/anthropic/anthropic.env
[[ -f ~/.secrets/chatwork/chatwork.env ]] && source ~/.secrets/chatwork/chatwork.env
