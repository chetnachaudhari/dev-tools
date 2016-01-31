export CLICOLOR=true
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_72.jdk/Contents/Home"
source ~/.git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
GIT_PS1_SHOWUPSTREAM="auto"
source ~/.git-completion.sh
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

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
# Set HIVE_HOME
export HIVE_HOME="/usr/lib/hive/apache-hive-1.2.1-bin"
PATH=$PATH:$HIVE_HOME/bin
export PATH
source ~/dev-tools/.bash_history_settings
