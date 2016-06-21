# Backward compatibility for the most part
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# General configuration
CLICOLOR=1
PS1="[\W]\$ "

# Paths
PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin

# Programming environment setup
eval "$(rbenv init -)"
