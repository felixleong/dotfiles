CLICOLOR=1
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth

set -o vi
export PATH="$HOME/.rbenv/bin:$PATH"

# Python environment configuration
WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/local/bin/virtualenvwrapper.sh

# Ruby environment
eval "$(rbenv init -)"
alias rbex='bundle exec ruby'
alias rkex='bundle exec rake'
