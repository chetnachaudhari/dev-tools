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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
