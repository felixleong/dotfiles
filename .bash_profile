CLICOLOR=1
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth
EDITOR=vim

echo ">> Imported?"
set -o vi
export PATH="./node_modules/.bin:./bin:$HOME/.local/bin/:$HOME/bin:$HOME/.rbenv/bin:$HOME/.yarn/bin:$PATH"
export UGID="$(id -u):$(id -g)"

# Python environment
PIPENV_VENV_IN_PROJECT=true

# Ruby environment
eval "$(rbenv init -)"

alias ls='ls --color=auto'
alias bdex='bundle exec'
alias rbex='bundle exec ruby'
alias rkex='bundle exec rake'
alias pygrep='grep --include=*.py --exclude-dir=migrations'
alias awssh='assh -i ~/.ssh/soniapk'

[[ -f ~/.bash_alias ]] && . ~/.bash_alias
