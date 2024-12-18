# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in Vi Mode
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no

# Aliases
alias v='nvim'
alias c='clear'
alias tree='tree -C'
alias ls='eza --icons=always --color=always --no-filesize --no-time --no-user --no-permissions'
alias ff='fastfetch'
alias gg='lazygit'
alias zj='zellij'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias hx='helix'
fi

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"

export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/homebrew/opt/rustup/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export GOPATH=$HOME/go
# export PATH=/usr/local/go/bin:$PATH
# export PATH=/go/bin/goimports:$PATH
export PATH=/Users/prxsto/opt/miniconda3/bin:$PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export HOMEBREW_NO_ENV_HINTS=TRUE
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/prxsto/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/prxsto/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/prxsto/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/prxsto/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

