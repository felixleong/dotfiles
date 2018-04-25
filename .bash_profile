CLICOLOR=1
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth
EDITOR=vim

set -o vi
export PATH="./node_modules/.bin:./bin:$HOME/.local/bin/:$HOME/bin:$HOME/.rbenv/bin:$HOME/.nenv/bin:$HOME/.yarn/bin:$PATH"
eval $(dircolors $HOME/.dir_colors/dircolors)

# Python environment
PIPENV_VENV_IN_PROJECT=true

# Ruby environment
eval "$(rbenv init -)"
eval "$(nenv init -)"

alias ls='ls --color=auto'
alias bdex='bundle exec'
alias rbex='bundle exec ruby'
alias rkex='bundle exec rake'
