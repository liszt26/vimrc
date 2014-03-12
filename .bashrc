#PS1="\[\e[36;1m\]@\[\e[33;1m\]\u\[\e[34;1m\][\[\[\e[31;1m\]\!\[\e[34;1m\]]\e[32;1m\](\[\e[37;1m\]\w\[\e[32;1m\])\e[35;1m\]-> \[\e[37;0m\]"
PS1="\[\e[36;1m\]@\[\e[33;1m\]\u\e[34;1m\]\e[32;1m\](\[\e[37;1m\]\w\[\e[32;1m\])\e[35;1m\]->\[\e[37;0m\]"


alias ls='ls  -alG --show-control-chars --color=auto'

#PATH
export PATH="/usr/local/mysql/bin:$PATH"

#python 
alias pys='python manage.py runserver'

#rails4
alias r4='/Users/liszt26/Documents/rails/rails4/rails/railties/bin/rails'

PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting
