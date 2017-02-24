# Author : Taha

  # .bash_profile runs when you start a login/session shell;
  # every time you open a shell (tab or a new window, It's a login shell and .bash_profile executes; 
  # BUT 
  # .bashrc runs every time you start a sub-shell;
  # A Non login shell is started by a program without a login, 
  # PS1='taha@localhost \W \$ ' # prompt 


export CLICOLOR=1

# The awesomeness 
set -o vi
set bell-style none
set keymap vi-command
bind -m vi-insert "\C-l":clear-screen # DO NOT PUT A SPACE AFTER THE ':'

apacheStart='sudo /usr/local/apache/apachectl start'

# Aliases 
# To refresh: source ~/.bash_profile
alias emacsD='launchctl load /Library/LaunchAgents/gnu.emacs.daemon.plist'
alias wb='cd /usr/local/apache2/'
alias cl='clear'
alias lss='ls -lS'     
alias lsd='ls -lSd */'
alias vim='/usr/local/bin/vim'
alias vr='vim ~/.vimrc'
alias bp='vim ~/.bash_profile'
alias note='cd ~/ComputerScience/notes' 
alias grep='grep -n  -P --color=always'
alias apacheStart='sudo /usr/local/apache2/bin/apachectl start'
alias apacheStop='sudo /usr/local/apache2/bin/apachectl stop'
alias apacheRestart='sudo /usr/local/apache2/bin/apachectl restart'

PATH=/usr/local/apache2/:/Users/taha/ComputerScience/Sage/SageMath:/Users/taha/.local/bin:/usr/local/Cellar/gnupg/1.4.21/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:Library/Frameworks/Python.framework/Versions/3.5/bin:~/.cabal/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH
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
