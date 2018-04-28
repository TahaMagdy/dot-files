" Author : Taha Magdy
" - vim executes ~/.vimrc immediately after it launches
"
" - Reloading ~/.vimrc is not a good idea; if you have defined function, 
"   commands and variables;  they will be redefined every time you Reload vimrc
"
" - So I have separated configuration and  commands/function/variables
"   definitions in two files.
"



" Active Patheogen
execute pathogen#infect()

" My Commands
command Reload      source ~/.vimrc_helper
command ReloadVimrc source ~/.vimrc
command VimrcHelper e ~/.vimrc_helper
command Vimrc       e ~/.vimrc
command BashProfile e ~/.bash_profile

" Load the configurations
source ~/.vimrc_helper
