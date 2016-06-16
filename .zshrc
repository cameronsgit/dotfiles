# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sowderca/.zshrc'
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
# End of lines added by compinstall
export TERM=xterm-256color
source /home/sowderca/antigen.zsh
antigen use oh-my-zsh
antigen bundle vi-mode
antigen bundle git 
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply
# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
# Alias
alias cls=clear
alias nuget="mono /home/sowderca/Tools/Nuget/nuget.exe"
alias composer="php /home/sowderca/composer.phar"
alias eclim="/home/sowderca/.eclipse/org.eclipse.platform_4.5.2_479262390_linux_gtk_x86_64/eclimd"
alias vc3-cae-lnx-02="64.28.197.163"
alias vdi-2012r2="10.51.16.106"
alias git=hub
alias parse=parse-cli
alias tslint='tslint -s ~/.nvm/versions/node/v5.3.0/lib/node_modules/tslint-stylish -t stylish'
alias vdir="ls -l"
alias vim=nvim
alias weather="weather -a 'Columbia, SC'"
alias datagrip="/home/sowderca/Tools/DataGrip-1.0.2/bin/datagrip.sh"
alias rider="/home/sowderca/Tools/riderRS-144.4571/bin/rider.sh"
alias codeclimate="/home/sowderca/Tools/codeclimate-master/codeclimate-wrapper"
alias rubocop="rubocop --format fuubar"
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export NVM_DIR="/home/sowderca/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "/home/sowderca/.dnx/dnvm/dnvm.sh" ] && . "/home/sowderca/.dnx/dnvm/dnvm.sh" # Load dnvm
export VAGRANT_DEFAULT_PROVIDER="vmware_workstation"
export DEBFULLNAME="Cameron Sowder" 
export DEBEMAIL="cameron@sowder.io"
export PATH="$PATH:/home/sowderca/.local/share/umake/dart/dart-sdk/bin"
export PATH="$PATH:/home/sowderca/Tools/genymotion/"
export PATH="$PATH:/home/sowderca/.local/share/umake/swift/usr/bin"
export PATH="$PATH:/home/sowderca/.local/share/umake/rust/rust-lang/cargo/bin"
export PATH="$PATH:/home/sowderca/Tools/infer-linux64-v0.5.0/infer/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/sowderca/.conscript/bin"
export PATH="$PATH:/opt/wine-staging/bin"
export PATH="$PATH:/home/sowderca/.pub-cache/bin"
export PATH="$PATH:/home/sowderca/Tools/genymotion"
export PATH="$PATH:/home/sowderca/Tools/buck/bin"
export PATH="$PATH:/home/sowderca/go/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/home/sowderca/.composer/vendor/bin"
export GOPATH=$HOME/Devwork/Workspace
export GO15VENDOREXPERIMENT=1
export HOMEBREW_EDITOR=vim
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export GOROOT="/usr/lib/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH=$NODE_PATH:/home/sowderca/.nvm/versions/node/v5.3.0/lib/node_modules
export GEMNASIUM_TOKEN=dc2b4be478e429652e1b93f40eae5aa3
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# OPAM configuration
. /home/sowderca/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# added by travis gem
[ -f /home/sowderca/.travis/travis.sh ] && source /home/sowderca/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /home/sowderca/.nvm/versions/node/v5.3.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /home/sowderca/.nvm/versions/node/v5.3.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
