# zstyle
zstyle :compinstall filename "$HOME/.zshrc"
zmodload zsh/complist

# keybindings
bindkey -v
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect '^M' .accept-line

# options
setopt interactivecomments
setopt no_beep

# compinit
autoload -Uz compinit
autoload -U colors
autoload -U add-zsh-hook
colors
compinit

[[ -f ~/.zplug/init.zsh ]] || return

# Ensure zplug installation
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Source
source "${HOME}/.zplug/init.zsh"
source "${HOME}/.cargo/env"
source "${HOME}/.local/bin/sync-devwork.sh"
source "${HOME}/.local/bin/system-update.sh"

# Load plugins
zplug "plugins/git", from:oh-my-zsh, as:plugin
zplug "plugins/docker", from:oh-my-zsh, as:plugin
zplug "plugins/minikube", from:oh-my-zsh, as:plugin
zplug "plugins/vi-mode", from:oh-my-zsh, as:plugin
zplug "mafredri/zsh-async", from:github
zplug "sowderca/pure", use:pure.zsh, from:github, as:theme
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

# Install packages that have not yet been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Load zplug
zplug load

# Alias
alias cls=clear
alias vim=nvim
alias dir="ls -l"
alias del=rm
alias git=hub
alias powershell=pwsh
alias start=open
alias tmux="env TERM=screen-256color tmux"

# PATH setup
path+=("$(go env GOPATH)/bin")
path+=("${KREW_ROOT:-$HOME/.krew}/bin")
path+=("${HOME}/.fastlane/bin")
path+=("${HOME}/.porter")

if which ruby >/dev/null && which gem >/dev/null; then
    path+=("$(ruby -rubygems -e 'puts Gem.user_dir')/bin")
fi

export PATH

# Settings for base16
BASE16_SHELL="$HOME/.config/base16-shell"
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# NVM / Node.js
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RBENV
eval "$(rbenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
