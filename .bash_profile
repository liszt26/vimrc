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


[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*
