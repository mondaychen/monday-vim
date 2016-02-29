source ~/.git-completion.bash

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load the default .bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias py2="source ~/paths/python_env/bin/activate"
alias py3="source ~/paths/py3_env/bin/activate"

alias vg="sh ~/tools/vagrant.sh"
alias vgsus="sh ~/tools/suspend-vagrant.sh"
alias vgdisk="sh ~/tools/sshfs-vagrant.sh"

alias git="LANG=en_US.UTF-8 git"

alias edge_w="weinre --boundHost 0.0.0.0"

#PS1='Emika:\W \u\$ '

#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H>; \[\e[0m\]"
#export PS1="\u@\h:\W $ " #user@host:workspace-path $
export PS1="\[\e[31;1m\]\h\[\e[37;1m\] @ \[\e[33;1m\]\u \[\e[37;1m\]: \[\e[32;1m\]\w \[\e[36;1m\]\$ \[\e[0m\] "
export CLICOLOR=1 #启用颜色
export LSCOLORS=Excbdxxxfxhxhxhxhxcxcx #设置颜色


#alias
alias ll='ls -al'

alias pdfgrep='pdfgrep -HiR'

export GOPATH="/Users/Monday/paths/go_path/"

PATH=$PATH:$HOME/paths
