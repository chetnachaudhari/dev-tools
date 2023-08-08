export CLICOLOR=true
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
source ~/.git-prompt.sh
#source ~/.git-stats.sh

# Source the git bash completion file
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM="auto"
    PS1='\t:\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] \W$ '
fi

export PS1

ENVLOC=$HOME/.bashvars
function grabvars {
    vars="
    SSH_AGENT_PID
    SSH_AUTH_SOCK
    GNOME_KEYRING_SOCKET
    GNOME_KEYRING_PID
    SESSION_MANAGER
    XAUTHORITY
    DBUS_SESSION_BUS_ADDRESS
    DISPLAY
    ";

     for i in $vars;do
            echo "${i}=\"${!i}\"";
                done > $ENVLOC
}

if [ "$TERM" = "screen" ]; then
  #PROMPT_COMMAND='echo -ne "\033k[$HOSTNAME\033\\"'  
  screen_set_window_title () {
    local HPWD="$PWD"
    case $HPWD in
      $HOME) HPWD="~";;

      ## long name option:
      # $HOME/*) HPWD="~${HPWD#$HOME}";;

      ## short name option:
      *) HPWD=`basename "$HPWD"`;;

    esac
    printf '\ek%s\e\\' "$HPWD"
  }
  PROMPT_COMMAND="screen_set_window_title; $PROMPT_COMMAND"
fi
precmd()
{
   if [[ ( ${-} == *i* ) && ( ${TERM} == screen* ) ]]
   then
      echo -n "\ek$(hostname -s)\e\\"
   fi
}
export EDITOR=vim
export HISTCONTROL=ignoredups
shopt -s histappend
export PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
