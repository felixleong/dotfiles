CLICOLOR=1
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth
EDITOR=vim

set -o vi
export PATH="./node_modules/.bin:./bin:$HOME/.rbenv/bin:$HOME/.local/bin/:$HOME/bin:$PATH"
eval $(dircolors /home/felix/.dir_colors/dircolors)

# Python environment configuration
WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python3)
if [ "$PIPENV_ACTIVE" != '1' ]; then
    [ -f $HOME/.local/bin/virtualenvwrapper.sh ] && source $HOME/.local/bin/virtualenvwrapper.sh
fi

# Ruby environment
eval "$(rbenv init -)"
alias python='python3'
alias pip='pip3'
alias ls='ls --color=auto'
alias bdex='bundle exec'
alias rbex='bundle exec ruby'
alias rkex='bundle exec rake'
