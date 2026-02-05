# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load and customize the powerlevel10k theme
source /opt/powerlevel10k/powerlevel10k.zsh-theme
test -f ~/.p10k.zsh && source ~/.p10k.zsh

# Enable asdf integration
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# Command aliases
test -f ~/.zsh_aliases && source ~/.zsh_aliases

# Add Linuxbrew to path
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"

# Add VS Code CLI to path
PATH="/mnt/c/Users/k/AppData/Local/Programs/Microsoft VS Code/bin:$PATH"

# Add $HOME/bin to PATH
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

# Initialize ZSH completion
autoload -Uz compinit && compinit

# Enable ZSH history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

export XDG_CONFIG_HOME="$HOME/.config"

# Jumping between CLI words with Ctrl+Forward/Backward arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Golang
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
source ~/.asdf/plugins/golang/set-env.zsh
