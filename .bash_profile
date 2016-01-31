[ -f ~/.bashrc ] && source ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#### better history
## Enable date timestamp in history
export HISTTIMEFORMAT='%F %T '
## Ignore duplicate commands in history
export HISTCONTROL=ignoredups
export HISTSIZE=10000
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
