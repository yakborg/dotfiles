# SSH agent auto-start (persistent across shells)
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

[[ -f ~/.secrets/env/yakborg.secret ]] && source ~/.secrets/env/yakborg.secret
