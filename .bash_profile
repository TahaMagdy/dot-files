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
alias wb='/Library/WebServer/Documents'
alias cl='clear'
alias lss='ls -lS'
alias lsd='ls -lSd */'
alias vim='/Users/taha/Documents/sources/vim/src/vim'
alias vr='vim ~/.vimrc'
alias bp='vim ~/.bash_profile'
alias note='cd ~/ComputerScience/notes'
alias grep='grep -n  -P --color=always'
#alias apacheStart='sudo /usr/local/apache2/bin/apachectl start'
#alias apacheStop='sudo /usr/local/apache2/bin/apachectl stop'
#alias apacheRestart='sudo /usr/local/apache2/bin/apachectl restart'
alias emacs='/Applications/MacPorts/Emacs.app/Contents/MacOS/Emacs'
alias emacsclient='/Applications/MacPorts/Emacs.app/Contents/MacOS/bin/emacsclient '
alias off='networksetup -setairportpower en0 off'
alias on='networksetup -setairportpower en0 on'
alias env='source activate gl-env'
alias octave='octave-cli'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias less='less -R'
screen='/usr/local/bin/screen'






PATH=/usr/local/apache2/:/Users/taha/ComputerScience/SageMath:/Users/taha/.local/bin:/usr/local/Cellar/gnupg/1.4.21/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:Library/Frameworks/Python.framework/Versions/3.5/bin:~/.cabal/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/ComputerScience/programs:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin/:/Library/Haskell/bin:/Users/taha/Library/Haskell/bin:$PATH

PATH=$HOME/.cabal/bin:$PATH


export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
alias ls='CLICOLOR_FORCE=1 ls -G'
export TERM=xterm-256color

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

# added by Anaconda2 4.4.0 installer
export PATH="/Users/taha/anaconda/bin:~/Documents/sources/SageMath/:$PATH"
##################################################
clear # Hiding last login time message; or $ touch .hushlogin instead
echo "  Hello, I'm .bash_profile and I love you <3!
    You can put some reminders in here!
    .
    "

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
