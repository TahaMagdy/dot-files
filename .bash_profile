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

# The awesomeness 
set -o vi
set bell-style none
set keymap vi-command
bind -m vi-insert "\C-l":clear-screen # DO NOT PUT A SPACE AFTER THE ':'


# My Aliases > # To refresh: source ~/.bash_profile
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias wb='cd /Library/WebServer/Documents/'
alias cl='clear'
alias lss='ls -lS'     
alias lsd='ls -lSd */'
            # some ls options #{{{
            # -r Reverse the order
            # -S Sort files by size
            # -u Time of last access
            # -t Time of last edit
            # -U Time of file creation#}}}
alias vim='/usr/local/bin/vim'
alias vd='cd ~/.vim'
alias ghci='/usr/local/bin/ghci'
alias vb='cd ~/.vim/bundle'
alias vr='vim ~/.vimrc'
alias bp='vim ~/.bash_profile'
alias note='cd ~/ComputerScience/notes' 
alias cabal='/usr/local/bin/cabal'
alias gpg='/usr/local/Cellar/gnupg/1.4.21/bin/gpg1'
alias grep='grep -n  -P --color=always'
alias jhbuild='/Users/taha/.local/bin/jhbuild'
PATH="$PATH":/Users/taha/ComputerScience/Sage/SageMath
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
PATH=$PATH:~/.cabal/bin
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/Users/taha/ComputerScience/Sage/SageMath:/usr/local/bin/mysql
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH

# tab completion
source ~/.git-completion.bash




# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"



# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
    # '\u' adds the name of the current user to the prompt
    # '\$(__git_ps1)' adds git-related stuff
    # '\W' adds the name of the current directory

##################################################

clear # Hiding last login time message; or $ touch .hushlogin instead
echo "  Hello, I'm .bash_profile and I love you <3!
    You can put some reminders in here!
    .
    "

##
# Your previous /Users/taha/.bash_profile file was backed up as /Users/taha/.bash_profile.macports-saved_2016-11-19_at_01:05:30
##

# MacPorts Installer addition on 2016-11-19_at_01:05:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/taha/.bash_profile file was backed up as /Users/taha/.bash_profile.macports-saved_2017-01-24_at_21:31:12
##

# MacPorts Installer addition on 2017-01-24_at_21:31:12: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

