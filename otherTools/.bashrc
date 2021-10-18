# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
set -o vi
#xprop -root -f _NET_NUMBER_OF_DESKTOPS 32c -set _NET_NUMBER_OF_DESKTOPS 3
#xprop -root -f _NET_DESKTOP_LAYOUT 32cccc -set _NET_DESKTOP_LAYOUT 0,1,3,0

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

alias docker-run-gui='XSOCK=/tmp/.X11-unix && XAUTH=/tmp/.docker.xauth && xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && docker run  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY'
alias imdone='docker-run-gui -v $PWD:/mydata --rm --privileged=true imdone'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#alias deploy="mv $(ls /tmp/*gz -rc | tail -n 2  -f) /run/media/juho/Samsung_T5/deploys/"
alias branchdiff="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
