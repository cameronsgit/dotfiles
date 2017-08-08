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
alias dir="ls -l"
alias git=hub

# Evaluate environmental changes
eval `opam config env`
eval "$(rbenv init -)"

# Environmental modifications
# ---------------------------

# Fixes GPG on macOS
export GPG_TTY=$(tty)
export TOOLCHAINS=swift # wtf is this
export HOMEBREW_GITHUB_API_TOKEN="1ccd433ff39398142d5162f4d4fc0ca13b6fa74d" # Fixes brew api limitations on macOS
export TERMINFO="$HOME/.terminfo"  # Adds italic font support to macOS
# export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
# export PATH="/usr/local/share/dotnet/bin:$PATH"
# export PATH="$PATH:/usr/local/go/bin"
# export PATH="$PATH:/Users/sowderca/.cargo/bin:$PATH"
# export PATH="$PATH:/Users/sowderca/Devwork/Workspace/bin"

# Go tooling
export GOPATH='/Users/sowderca/Devwork/Workspace'
export PATH="$PATH:/usr/local/go/bin:$PATH"
export PATH="$PATH:/Users/sowderca/Devwork/Workspace/bin:$PATH"
# Rust tooling
export PATH="$PATH:/Users/sowderca/.multirust/toolchains/stable-x86_64-apple-darwin/bin" # Adds Rust tools to the path
export PATH="$PATH:/Users/sowderca/.cargo/bin:$PATH" # Adds Cargo tools to the path
export RUST_SRC_PATH="/Users/sowderca/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src" # Rust src ( needed for IDEs )

# Adds support for dart lang tools
export PATH="$PATH:/Users/sowderca/.pub-cache/bin"
# Php tooling 
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export GOPATH='/Users/sowderca/Devwork/Workspace'
export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home"
export NVM_DIR='/Users/sowderca/.nvm'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

function system-update() {
	bash /Users/sowderca/Scripts/Shell/system-update.sh
}

function sync-devwork() {
	bash /Users/sowderca/Scripts/Shell/syncDevwork.sh
}

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# added by travis gem
[ -f /Users/sowderca/.travis/travis.sh ] && source /Users/sowderca/.travis/travis.sh
# if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
PATH="/Users/sowderca/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/sowderca/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/sowderca/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/sowderca/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/sowderca/perl5"; export PERL_MM_OPT;
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval $(/usr/libexec/path_helper -s)
export PATH="/usr/local/sbin:$PATH"
