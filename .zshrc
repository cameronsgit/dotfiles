# Path to your oh-my-zsh installation.
export ZSH=/home/sowderca/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"
TERM="xterm-256color"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="~/bin/:$PATH"
export MONO_MANAGED_WATCHER=disabled
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls=clear
alias eclim='/home/sowderca/Downloads/eclipse/eclimd'
alias nuget='mono /home/sowderca/Devwork/Tools/nuget.exe'
alias vc3-cae-lnx-02=64.28.197.163
export PATH="$HOME/.rbenv/bin:$PATH"
source ~/.nvm/nvm.sh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"
[[ -s "/home/sowderca/.gvm/scripts/gvm" ]] && source "/home/sowderca/.gvm/scripts/gvm"
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/home/sowderca/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/home/sowderca/.cabal/bin:/home/sowderca/.gvm/pkgsets/go1.4/global/bin:/home/sowderca/.gvm/gos/go1.4/bin:/home/sowderca/.gvm/pkgsets/go1.4/global/overlay/bin:/home/sowderca/.gvm/bin:/home/sowderca/.gvm/bin:/home/sowderca/.nvm/versions/node/v0.12.7/bin:/usr/local/heroku/bin:/home/sowderca/.rbenv/shims:/home/sowderca/.pyenv/shims:/home/sowderca/.pyenv/bin:/home/sowderca/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/home/sowderca/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/home/sowderca/.cabal/bin:/home/sowderca/.gvm/pkgsets/go1.4/global/bin:/home/sowderca/.gvm/gos/go1.4/bin:/home/sowderca/.gvm/pkgsets/go1.4/global/overlay/bin:/home/sowderca/.gvm/bin:/home/sowderca/.gvm/bin:/home/sowderca/.nvm/versions/node/v0.12.7/bin:/usr/local/heroku/bin:/home/sowderca/.rbenv/shims:/home/sowderca/.pyenv/shims:/home/sowderca/.pyenv/bin:/home/sowderca/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

[ -s "/home/sowderca/.dnx/dnvm/dnvm.sh" ] && . "/home/sowderca/.dnx/dnvm/dnvm.sh" # Load dnvm
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/home/sowderca/.nvm/versions/node/v0.12.7/lib/node_modules

# added by travis gem
[ -f /home/sowderca/.travis/travis.sh ] && source /home/sowderca/.travis/travis.sh
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
