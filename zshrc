# vim keybindings
bindkey -v

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

HISTSIZE=10000
SAVEHIST=10000

# options
setopt interactivecomments
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# compinit
autoload -Uz compinit
autoload -U colors
colors
compinit

# Ensure zplug installation
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Source zplug
source ~/.zplug/init.zsh

# Load plugins
zplug "plugins/git", from:oh-my-zsh, as:plugin
zplug "plugins/vi-mode", from:oh-my-zsh, as:plugin
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/completion", from:oh-my-zsh

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
alias git=hub

# Env setup
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/Workspace/go"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export CLICOLOR=1
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.fastlane/bin:$PATH"
export RUST_SRC_PATH="/Users/sowderca/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"
# Sync script
function sync-devwork() {
	sh $HOME/.dotfiles/local/bin/sync-devwork
}

function system-update() {
	sh $HOME/.dotfiles/local/bin/system-update
}


# Settings for base16
BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# NVM / Node.js
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sowderca/Workspace/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sowderca/Workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sowderca/Workspace/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sowderca/Workspace/google-cloud-sdk/completion.zsh.inc'; fi

# OPAM configuration
. /Users/sowderca/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
