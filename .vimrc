" Author : Taha Magdy


" Active Patheogen
execute pathogen#infect()

" Sets
filetype on
syntax on
colorscheme default
set nospell
set number
set relativenumber
set encoding=utf-8
set noswapfile
set ruler
set spell spl=en
set showmatch
set hlsearch
set title
set nospell
set expandtab
set tabstop=4
"set list " show all kind of white spaces
set shiftwidth=4
set wrap
set textwidth=81
set linebreak
set incsearch
set ttyfast
set t_Co=256
set foldcolumn=0


" mappings
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
map <C-h> :noh<CR>
map <C-x> :TableModeToggle<CR>
map <C-c> :cd %:h<CR>
map cm  :CommandT<Cr>
map rmb :bdelete<Cr>
map s=  :set spell<Cr>
map s-  :set nospell<Cr>
"map O   O<Esc>
"map o   o<Esc>
map <C-h> <C-w><
map <C-l> <C-w>>
map <C-j> <C-w>+
map <C-k> <C-w>-
" no arrows :D
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop> 
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>
imap jk     <Esc>



" SnipMate
imap <tab> <Plug>snipMateNextOrTrigger
smap <tab> <Plug>snipMateNextOrTrigger
"imap pp <Plug>snipMateNextOrTrigger
"smap pp <Plug>snipMateNextOrTrigger


" taglist conf.
" <leader> = \
let Tlist_Ctags_Cmd  ='/usr/local/bin/ctags-exuberant'
let g:tagbar_left    = 1
let g:tagbar_left    = 1
let g:tagbar_width   = 25
map <leader>t  :Tlist<cr> 


" git gutter conf.
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_async = 0
set updatetime=250 
set diffopt+=vertical


" Special stuff for specific filetypes 
autocmd BufEnter *.hs           set nospell
autocmd BufEnter *.rev          set nospell
autocmd BufEnter __Tag_List__   set nospell
autocmd BufEnter *.mail         set nonumber norelativenumber
autocmd BufEnter *.txt          set noautoindent 
autocmd BufEnter *.snippets     set noexpandtab list
"autocmd BufEnter *.markdown colorscheme badwolf

" You Complete Me conf.
set completeopt-=preview
