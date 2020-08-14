# Load Antigen
source ~/.antigen/antigen.zsh

# gpg terminal fix
export GPG_TTY=$(tty)

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Pre-load bundlesettings
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
zstyle :omz:plugins:ssh-agent lifetime 6h
SHORT_HOST=$(whoami)
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true

# Load bundles
antigen bundle tmux # load tmux first
antigen bundle ansible
antigen bundle command-not-found
antigen bundle cp
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-extras
antigen bundle gpg-agent
antigen bundle history
antigen bundle nmap
antigen bundle pip
antigen bundle python
antigen bundle rsync
antigen bundle ssh-agent
antigen bundle sudo
antigen bundle vscode
antigen bundle vundle
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Set theme
antigen theme romkatv/powerlevel10k

# Done!
antigen apply

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k theme customizations
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 integration
[[ ! -f ~/.iterm2_shell_integration.zsh ]] || source ~/.iterm2_shell_integration.zsh

# Command aliases
[[ ! -f ~/.zaliases ]] || source ~/.zaliases

# Customize PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
