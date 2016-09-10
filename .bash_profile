# Author : Taha
# Date   : 2016-08-06

# .bash_profile runs when you start a login/session shell;
    # every time you open a shell (tab or a new window, It's a login shell and .bash_profile executes; 
# BUT 
# .bashrc runs every time you start a sub-shell;
    # A Non login shell is started by a program without a login, 


# PS1='taha@localhost \W \$ ' # prompt 
CLICOLOR=1
export CLICOLOR=1

# My Aliases > # To refresh: source ~/.bash_profile
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias wb='cd /Library/WebServer/Documents/'
alias lss='ls -lS'     
alias lsd='ls -lSd */'
            # some ls options #{{{
            # -r Reverse the order
            # -S Sort files by size
            # -u Time of last access
            # -t Time of last edit
            # -U Time of file creation#}}}
alias vim='/usr/local/bin/vim'
alias vimd='cd ~/.vim'
alias vimb='cd ~/.vim/bundle'
alias note='cd ~/ComputerScience/notes' 
PATH="$PATH":/Users/taha/ComputerScience/Sage/SageMath
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/Users/taha/ComputerScience/Sage/SageMath:/usr/local/bin/mysql
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH

# git tab completion
source ~/.git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"



# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

##################################################

clear # Hiding last login time message; or $ touch .hushlogin instead
echo "  Hello, I'm .bash_profile and I love you <3!
    You can put some reminders in here!
    .
    "
