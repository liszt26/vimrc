if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


export PATH=$PATH:/usr/local/nginx/sbin

##
# Your previous /Users/liszt26/.bash_profile file was backed up as /Users/liszt26/.bash_profile.macports-saved_2013-03-25_at_15:51:13
##

# MacPorts Installer addition on 2013-03-25_at_15:51:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
