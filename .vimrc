" Author : Taha Magdy

" Math"{{{
map! <C-v>fa ∀
map! <C-v>ll →
map! <C-v>hh ⇌
map! <C-v>sr √
map! <C-v>kk ↑
map! <C-v>jj ↓
map! <C-v>= ∝
map! <C-v>~ ≈
map! <C-v>!= ≠
map! <C-v>!> ⇸
map! <C-v>~> ↝
map! <C-v>>= ≥
map! <C-v><= ≤
map! <C-v>0  °
map! <C-v>ce ¢
map! <C-v>*  •
map! <C-v>co ⌘"}}}
" Greek"{{{
map! <C-v>GA Γ
map! <C-v>DE Δ
map! <C-v>TH Θ
map! <C-v>LA Λ
map! <C-v>XI Ξ
map! <C-v>PI π
map! <C-v>SI Σ
map! <C-v>PH Φ
map! <C-v>PS Ψ
map! <C-v>OM Ω
map! <C-v>al α
map! <C-v>be β
map! <C-v>ga γ
map! <C-v>de δ
map! <C-v>ep ε
map! <C-v>ze ζ
map! <C-v>et η
map! <C-v>th θ
map! <C-v>io ι
map! <C-v>ka κ
map! <C-v>la λ
map! <C-v>mu μ
map! <C-v>xi ξ
map! <C-v>pi π
map! <C-v>rh ρ
map! <C-v>si σ
map! <C-v>ta τ
map! <C-v>ps ψ
map! <C-v>om ω
map! <C-v>ph ϕ"}}}
" mappings ^^"{{{
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
map <C-a> :noh<CR>
map <C-x> :TableModeToggle<CR>
map <C-b> :cd %:h<CR>

map rmb :bdelete<Cr>
map cm  :CommandT<Cr>
map O   O<Esc>
map o   o<Esc>
map s=  :set spell<Cr>
map s-  :set nospell<Cr>



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
set swapfile
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
    Plugin 'wincent/command-t'
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
" Special stuff for specific filetypes "{{{
"autocmd BufEnter *.markdown colorscheme badwolf
autocmd BufEnter *.hs       set nospell
autocmd BufEnter *.rev      set nospell
autocmd BufEnter *.mail     set nonumber norelativenumber
autocmd BufEnter *.txt      set noautoindent 
"}}}
" Global Variables and Colors"{{{
" command-t
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
" Explorer Mode - Tree style 
    let g:netrw_liststyle=3
    " mapping : (space+n) to navigate directories and files 
    let mapleader=" "
    map <leader>n :Explore<cr> 
    " Runtime Manipulation -- Activating Pathogen
    execute pathogen#infect() 
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
" Going into normal mode -- NO esc key any more! "{{{

" Press the j then k in row
imap jk     <Esc>



""}}}
