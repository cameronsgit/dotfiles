set -o vi
alias cls=clear
export CLICOLOR=1

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
