CLICOLOR=1
LSCOLORS=ExFxCxDxBxegedabagacad
SVN_EDITOR=vim
PS1="[\W]\$ "
HISTCONTROL=ignoreboth
LC_ALL=en_US.UTF-8
LC_CTYPE=$LC_ALL

CDPATH=$HOME/Projects:$HOME/Sites:$HOME
PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/share/python:/usr/local/opt/python/bin:/usr/local/opt/ruby/bin:/usr/local/opt/gettext/bin:$HOME/bin:$HOME/homebrew/bin:/usr/local/share/npm/bin
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export ANDROID_HOME="$(readlink -f /usr/local/opt/android-sdk)/"

source /usr/local/bin/virtualenvwrapper.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

alias gvim='mvim -p'
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim -p"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim -p"
alias ctags='/usr/local/bin/ctags'
alias ie8="wine 'C:\Program Files\Internet Explorer\iexplore'"
alias drax="wine 'c:\Program Files\Drax\Drax\drax.exe'"
alias mp3tag="wine 'C:\Program Files\Mp3tag\Mp3tag.exe'"
alias ssh_webhost="ssh -p 22017 felix@rainbowsarge.com"
alias ls="gls --color"
alias ant="LC_ALL=C ant"
alias gradle="LC_ALL=C gradle"
alias gradlew="LC_ALL=C ./gradlew"
#alias clearterm="echo -e \\033c" -- actual command being reset

set -o vi

# Start TMUX by default
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
