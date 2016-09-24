CLICOLOR=1
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth
EDITOR=vim

set -o vi
export PATH="$HOME/.rbenv/bin:./node_modules/.bin:./bin:$PATH"

# Python environment configuration
WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper.sh

# Ruby environment
eval "$(rbenv init -)"
alias ls='ls --color=auto'
alias bdex='bundle exec'
alias rbex='bundle exec ruby'
alias rkex='bundle exec rake'
