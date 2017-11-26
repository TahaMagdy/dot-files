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
" chnage buffers without the need of saving
set hidden
" show all kind of white spaces
"set list           
set shiftwidth=4
set wrap
set textwidth=81
set linebreak
set incsearch
set ttyfast
set t_Co=256
set foldcolumn=0
set timeout timeoutlen=90 " delay <3




" mappings
""""""""""
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
map bk    :bdelete<Cr> 
map  nm    :noh<Cr>
imap nm    <Esc>:noh<Cr>
map <C-x> :TableModeToggle<CR>
map <C-c> :cd %:h<CR>
" Buffer kill
map s=  :set spell<Cr>
map s-  :set nospell<Cr>
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
imap bl <Esc>:Bufferlist<Cr>
map  bl :Bufferlist<Cr>


" SnipMate
""""""""""
imap <tab> <Plug>snipMateNextOrTrigger
smap <tab> <Plug>snipMateNextOrTrigger
"imap pp <Plug>snipMateNextOrTrigger
"smap pp <Plug>snipMateNextOrTrigger


" taglist conf
""""""""""""""
" <leader> = \
let Tlist_Ctags_Cmd  ='/usr/local/bin/ctags-exuberant'
let g:tagbar_left    = 1
let g:tagbar_left    = 1
let g:tagbar_width   = 25
map <leader>t  :Tlist<cr> 


" git gutter conf
"""""""""""""""""
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_async = 0
set updatetime=250 
set diffopt+=vertical


" Special stuff for specific filetypes 
""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.rev          set nospell
autocmd BufEnter __Tag_List__   set nospell
autocmd BufEnter *.mail         set nonumber norelativenumber
autocmd BufEnter *.txt          set noautoindent 
autocmd BufEnter *.snippets     set noexpandtab list
"autocmd BufEnter *.markdown colorscheme badwolf

" You Complete Me conf
""""""""""""""""""""""
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_max_num_candidates = 10
" I may bind this to be 1 or zero as a trigger :"D
let g:ycm_auto_trigger = 0
" All files in the black list
" So, YCM will not complete any file.
" you have to put the files you want
" YCM to complete in the white list
let g:ycm_filetype_blacklist = {
      \ '*' : 1,
      \}
" except those
" so add only the file-types you need YCM to help
let g:ycm_filetype_blacklist = {
      \ 'c' : 1,
      \ 'cpp' : 1,
      \ 'py' : 1,
      \}
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
" trigger completion [YCM! Complete!]
let g:ycm_key_invoke_completion = '<C-k>'
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_use_ultisnips_completer = 0
" specify symbols to trigger YCM based on the file type
"let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.'],
"  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"  \             're!\[.*\]\s'],
"  \   'ocaml' : ['.', '#'],
"  \   'cpp,objcpp' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'ruby' : ['.', '::'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }
