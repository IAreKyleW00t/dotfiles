# Ensure SSH agent is running
ssh-add -l &>/dev/null
if [[ "$?" == 2 ]]; then
  echo -n "Starting SSH agent..."
  # Load stored agent connection info and test it
  test -r ~/.ssh-agent && eval "$(<~/.ssh-agent)" >/dev/null
  ssh-add -l &>/dev/null

  # Start new agent and store agent connection info if failed
  if [[ "$?" == 2 ]]; then
    (umask 066; ssh-agent > ~/.ssh-agent)
    eval "$(<~/.ssh-agent)" >/dev/null
  fi
  echo " Done!"
fi

# Load SSH identities
echo "Adding SSH identities..."
for key in $(ls ~/.ssh/id_* | grep -v .pub); do
  ssh-add -t "4h" "$key"
done

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

# Jumping between CLI words with Ctrl+Forward/Backward arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
