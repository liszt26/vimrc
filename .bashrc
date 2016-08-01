

#logcat
alias pl='adb logcat | ~/coloredlogcat.py'

export LSCOLORS=Gxfxcxdxbxegedabagacad

# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef
# よく使うエイリアスやら各コマンドのデフォルトのオプションを設定
alias ls='ls -CFalG'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias mysql.server='/usr/local/opt/mysql55/bin/mysql.server'

# git
source "/Users/liszt26/git-prompt.sh"
source "/Users/liszt26//git-completion.bash"
GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\[\033[1;30;32m\]\u@:\[\033[37m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$'

shopt -s nocaseglob

#Q for vagrant
source ~/.env/.env

export PATH=/usr/local/git/bin:$PATH

export PATH=$PATH:/Applications/sdk/platform-tools
export PATH=$PATH:/usr/local/src/scala/bin
export SCALA_HOME=/usr/local/src/scala

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
