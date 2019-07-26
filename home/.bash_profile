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

find_port() {
  if [ $1 ]; then
    lsof -nP -i4TCP:$1
  else
    lsof -nP -i4TCP
  fi
}

#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H>; \[\e[0m\]"
#export PS1="\u@\h:\W $ " #user@host:workspace-path $
export PS1="\[\e[31;1m\]\h\[\e[37;1m\] @ \[\e[33;1m\]\u \[\e[37;1m\]: \[\e[32;1m\]\w\[\e[38;5;219m\]\$(parse_git_branch) \[\e[36;1m\]\$ \[\e[0m\] "
export CLICOLOR=1 #启用颜色
export LSCOLORS=Excbdxxxfxhxhxhxhxcxcx #设置颜色

#alias
alias ll='ls -al'

alias pdfgrep='pdfgrep -HiR'

source $HOME/.go_profile

# export GOPATH="/Users/Monday/paths/go_path/:~/dev/core-common/src/go"
PATH=$PATH:$HOME/paths

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mchen205/google_cloud/path.bash.inc' ]; then source '/Users/mchen205/google_cloud/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mchen205/google_cloud/completion.bash.inc' ]; then source '/Users/mchen205/google_cloud/completion.bash.inc'; fi


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

