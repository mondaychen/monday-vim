source $HOME/.git-completion.bash

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load the default .bashrc

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias py2="source ~/paths/python_env/bin/activate"
alias py3="source ~/paths/py3_env/bin/activate"

alias git="LANG=en_US.UTF-8 git"


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Show the current bookmark or branch
if [ -f /opt/facebook/hg/share/scm-prompt.sh ]; then
  source /opt/facebook/hg/share/scm-prompt.sh
else
  _scm_prompt = parse_git_branch
fi

find_port() {
  if [ $1 ]; then
    lsof -nP -i4TCP:$1
  else
    lsof -nP -i4TCP
  fi
}

#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H>; \[\e[0m\]"
#export PS1="\u@\h:\W $ " #user@host:workspace-path $
export PS1="\[\e[31;1m\]\h\[\e[37;1m\] @ \[\e[33;1m\]\u \[\e[37;1m\]: \[\e[32;1m\]\w\[\e[38;5;219m\]\$(_scm_prompt) \[\e[36;1m\]\$ \[\e[0m\] "
export CLICOLOR=1 #启用颜色
export LSCOLORS=Excbdxxxfxhxhxhxhxcxcx #设置颜色

#alias
alias ll='ls -al'

alias pdfgrep='pdfgrep -HiR'

PATH=$PATH:$HOME/paths

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


# BEGIN: Block added by chef, to set environment strings
# Please see https://fburl.com/AndroidProvisioning if you do not use bash
# or if you would rather this bit of code 'live' somewhere else
. ~/.fbchef/environment
# END: Block added by chef

export PATH="$HOME/.cargo/bin:$PATH"
