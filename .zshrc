# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sowderca/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export TERM=xterm-256color
source /home/sowderca/antigen.zsh
antigen use oh-my-zsh
antigen bundle vi-mode
antigen bundle git 
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply
# Alias
alias cls=clear
alias buck="/home/sowderca/Tools/buck/bin/buck"
alias infer="/home/sowderca/Tools/infer/infer/bin/infer"
alias composer="php composer.phar"
alias vc3-cae-lnx-02="64.28.197.163"
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export NVM_DIR="/home/sowderca/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "/home/sowderca/.dnx/dnvm/dnvm.sh" ] && . "/home/sowderca/.dnx/dnvm/dnvm.sh" # Load dnvm
export PATH="$PATH:/usr/local/go/bin"
export GOROOT="/usr/local/go"
export GOPATH=$HOME/go
export SCALA_HOME="/usr/local/share/scala"
export PATH="$PATH:$SCALA_HOME/bin" 
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/home/sowderca/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(jenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
