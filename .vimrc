" Author : Taha Magdy


" Activating Pathogen -- Runtime manipulations"{{{
" Important for some plugins like (NERDTree)
execute pathogen#infect()
"}}}
" Math"{{{
map! <C-v>fa ∀
map! <C-v>ll →
map! <C-v>sr √
map! <C-v>~ ≈
map! <C-v>!= ≠
"}}}
" Greek"{{{
map! <C-v>TH Θ
map! <C-v>PI π
map! <C-v>SI Σ
map! <C-v>OM Ω
map! <C-v>al α
map! <C-v>be β
map! <C-v>ga γ
map! <C-v>de δ
map! <C-v>ep ε
map! <C-v>la λ
map! <C-v>mu μ
"}}}
" mappings ^^"{{{
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
map <C-a> :noh<CR>
map <C-x> :TableModeToggle<CR>
map <C-c> :cd %:h<CR>

map cm  :CommandT<Cr>
map rmb :bdelete<Cr>
map s=  :set spell<Cr>
map s-  :set nospell<Cr>
"map O   O<Esc>
"map o   o<Esc>

" Resizing 
map <C-h> <C-w><
map <C-l> <C-w>>
map <C-j> <C-w>+
map <C-k> <C-w>-

" NerdTree
let mapleader=" "
map <leader>n :NERDTree<cr> 
map <leader>cn :NERDTreeClose<cr>

" Taglist
map <leader>t  :Tlist<cr>
map <leader>ct :TlistClose<cr>
"}}}
" set commands"{{{
syntax on
colorscheme default
set encoding=utf-8
set noswapfile
set arabicshape
set autoread " reload vimrc :so $MYVIMRC
set number
set relativenumber
set ruler
set spell spl=en
set showmatch " highlight matching [{()}]
set hlsearch
set title
set formatoptions-=cro " disable auto .. comment
set expandtab " Convert tab to spaces 
set tabstop=4 " Remember no space around the `=`
set shiftwidth=4
set autoindent " indent newlines
set foldcolumn=0
set wrap
set textwidth=81
set linebreak
set omnifunc=syntaxcomplete#Complete
set incsearch
set ttyfast
set foldmethod=marker " Awesome
set sessionoptions+=folds
set backupskip=*.gpg
set backupdir=~/.vim/tmp
set directory=~/.vim/swap " List of directory names for the swap file, separated with commas.
set backup
set shortmess=filnxtToOI
set backspace=indent,eol,start
setlocal cm=blowfish
"set list " show white spaces as $
set fillchars="" " Removing split bar char;
set t_Co=256 "" This solve the vim/tmux color problem ,tells Vim to use 256 colors
"set laststatus=2 " Always show status line
"set wildmenu  " Completing ex-commands in a wider way;


""}}}
" Vundle configs "{{{
set nocompatible              " be iMproved, required
set showcmd " Doesn't work but after nocompatible
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
" Special stuff for specific filetypes "{{{
"autocmd BufEnter *.markdown colorscheme badwolf
autocmd BufEnter *.hs           set nospell
autocmd BufEnter *.rev          set nospell
autocmd BufEnter __Tag_List__   set nospell
autocmd BufEnter *.mail         set nonumber norelativenumber
autocmd BufEnter *.txt          set noautoindent 
"}}}
" {{{ macVim
if has("gui")
    set guifont=Menlo:h20
    set guicursor=a:block
    set guicursor=a:blinkwait700
    set guicursor=a:blinkon400
    set guicursor=a:blinkoff250
endif
" }}}
" Disabling the directional keys"{{{
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop> 
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>
"}}}
" Close Omni-Completion window when a selection is" made "{{{
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt-=preview
"}}}
" Going into normal mode -- NO esc key any more! "{{{
" Press the j then k in row
imap jk     <Esc>



""}}}
" Command-T options "{{{
let g:CommandTHighlightColor='PmenuSel' " Pmenu OR PmenuSel
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxHeight=10
let g:CommandTCancelMap=['<C-[>', '<C-c>']

"Omni menu colors 
highlight PmenuSel ctermfg=220 ctermbg=242 



"hi Search ctermfg=Yellow ctermbg=NONE cterm=bold " Search highlighting 
" ctermfg words color
" ctermfg words background

"
"}}}
" Tagbar options {{{
let g:tagbar_left    = 1
let g:tagbar_width   = 25
" }}}
" TagList options {{{

" }}}
" Gitgutter option {{{
set diffopt+=vertical
" }}}

let g:livepreview_previewer = 'open -a Preview'
