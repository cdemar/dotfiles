# ~/.zshrc runs every time an interactive shell starts (every new pane).
# Keep it fast: anything slow here is paid on every split.

# --- 1. Homebrew: puts brew-installed programs on the PATH ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- 2. Prompt: instant prompt must stay near the top of the file ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source "$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh   # created by `p10k configure`

# --- 3. History: long, shared between panes, no duplicates ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS

# --- 4. Tools ---
export EDITOR="nvim"
eval "$(zoxide init zsh)"          # `z part-of-name` jumps to a folder
source <(fzf --zsh)                # Ctrl-R fuzzy history, Ctrl-T fuzzy files
eval "$(fnm env --use-on-cd)"      # per-project Node versions

# --- 5. Aliases ---
alias v="nvim"
alias ls="eza --long --git --icons=always --no-filesize --no-time --no-user --no-permissions"
alias reload="source ~/.zshrc"

# --- 6. Secrets on demand ---
# Reading from 1Password takes about a second, so do it only when asked.
# Run `awsenv` in the pane that needs AWS.
awsenv() {
  export AWS_ACCESS_KEY_ID="$(op read 'op://Private/AWS Access Key/access key id')"
  export AWS_SECRET_ACCESS_KEY="$(op read 'op://Private/AWS Access Key/secret access key')"
  export AWS_DEFAULT_REGION="us-west-2"
}

# --- 7. Typing helpers: suggestions first, highlighting must load last ---
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
