# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load and customize the powerlevel10k theme
source /opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable asdf integration
source ~/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Command aliases
[[ ! -f ~/.zsh_aliases ]] || source ~/.zsh_aliases

# Add VS Code CLI to path
export PATH="$PATH:/mnt/c/Users/k/AppData/Local/Programs/Microsoft VS Code/bin"

# Add $HOME/bin to PATH
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

# Initialize ZSH completion
autoload -Uz compinit && compinit

# Enable ZSH history
export HISTFILE=~/.zsh_history
export SAVEHIST=1000
setopt appendhistory

# Fix GPG agent for WSL2
export GPG_TTY=$(tty)
