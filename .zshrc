# Lines configured by zsh-newuser-install
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/sowderca/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Antigen ( Plugins )
source /Users/sowderca/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle vi-mode
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

# Alias
alias cls=clear
alias vim=nvim
alias vdir="ls -l"
alias git=hub
alias gb="/Users/sowderca/Devwork/Workspace/bin/gb"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# ENV mods
export TOOLCHAINS=swift
export HOMEBREW_GITHUB_API_TOKEN="1ccd433ff39398142d5162f4d4fc0ca13b6fa74d"
export HAXE_STD_PATH="/usr/local/lib/haxe/std"
export TERMINFO="$HOME/.terminfo"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/kotlin/1.0.2/bin:$PATH"
export PATH="/usr/local/share/dotnet/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/Users/sowderca/.cargo/bin:$PATH"
export PATH="$PATH:/Users/sowderca/Devwork/Workspace/bin"
export PATH="$PATH:/Users/sowderca/.multirust/toolchains/stable-x86_64-apple-darwin/bin"
export PATH="$PATH:/Users/sowderca/.pub-cache/bin"
export GOPATH='/Users/sowderca/Devwork/Workspace'
export RUST_SRC_PATH="/Users/sowderca/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home"
export NVM_DIR='/Users/sowderca/.nvm'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

 #Misc
eval `opam config env`
eval "$(rbenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Theme
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
# added by travis gem
[ -f /Users/sowderca/.travis/travis.sh ] && source /Users/sowderca/.travis/travis.sh
# if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
[ -s "/Users/sowderca/.dnx/dnvm/dnvm.sh" ] && . "/Users/sowderca/.dnx/dnvm/dnvm.sh" # Load dnvm
PATH="/Users/sowderca/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/sowderca/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/sowderca/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/sowderca/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/sowderca/perl5"; export PERL_MM_OPT;
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
