" Author : Taha Magdy

" Add default buffers opens every time
" OR make a map to open them fast -> I prefere that.

" Active Patheogen
execute pathogen#infect()

" Sets
filetype on
syntax on
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
" change buffers without the need of saving
set hidden
" show all kind of white spaces
"set list           
set shiftwidth=4
set textwidth=81
set linebreak
set incsearch
set ttyfast
set t_Co=256
set foldcolumn=0
set timeout timeoutlen=160 " delay <3
set wrap


" 80 column boundary.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" mappings
"=========

" no shift colon <3
" This has a side effect on every remapping using :
" convert : to ;
nnoremap ; :
nnoremap : ;
""""""""""

map <C-n> ;bnext<CR>
map <C-p> ;bprev<CR>
map  bk    ;bdelete<Cr> 
map  bkk    ;bdelete!<Cr> 
map  nm    ;noh<Cr>
imap nm    <Esc>;noh<Cr>
map <C-x> ;TableModeToggle<CR>
map <C-c> ;cd %;h<CR>
" Buffer kill
map s=  ;set spell<Cr>
map s-  ;set nospell<Cr>
map <C-h> <C-w><
map <C-l> <C-w>>
map <C-j> <C-w>+
map <C-k> <C-w>-
" no arrows ;D
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop> 
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>
imap jk     <Esc>
map  bl ;CommandTBuffer<Cr>

" Run current Python buffer.
map rp  ;!clear; python3 % \| less<Cr>
 



" SnipMate
""""""""""
imap <tab> <Plug>snipMateNextOrTrigger
smap <tab> <Plug>snipMateNextOrTrigger
"imap pp <Plug>snipMateNextOrTrigger
"smap pp <Plug>snipMateNextOrTrigger

" tex sinpets
noremap \b bcw\begin{<C-R>"}<CR>\end{<C-R>"}<Esc>







" CommandT <3 ... <3
" Map <C-c> to jk
let g:CommandTCancelMap=['jk', '<C-c>']

" taglist conf
""""""""""""""
" <leader> = \
let Tlist_Ctags_Cmd  ='/usr/local/bin/ctags-exuberant'
let g:tagbar_left    = 1
let g:tagbar_left    = 1
let g:tagbar_width   = 25
map <leader>t  ;Tlist<cr> 


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
autocmd BufEnter *.py           set autoindent
"autocmd BufEnter *.markdown colorscheme badwolf



" You Complete Me conf
""""""""""""""""""""""
"set completeopt-=preview
"let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_max_num_candidates = 10
"" I may bind this to be 1 or zero as a trigger :"D
"let g:ycm_auto_trigger = 0
"" All files in the black list
"" So, YCM will not complete any file.
"" you have to put the files you want
"" YCM to complete in the white list
"let g:ycm_filetype_blacklist = {
"      \ '*' : 1,
"      \}
"" except those
"" so add only the file-types you need YCM to help
"let g:ycm_filetype_blacklist = {
"      \ 'c' : 1,
"      \ 'cpp' : 1,
"      \ 'py' : 1,
"      \}
"let g:ycm_key_list_select_completion = ['<C-n>']
"let g:ycm_key_list_previous_completion = ['<C-p>']
"" trigger completion [YCM! Complete!]
"let g:ycm_key_invoke_completion = '<C-k>'
"let g:ycm_filepath_completion_use_working_dir = 1
"let g:ycm_use_ultisnips_completer = 0

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



let g:indentLine_char = '¦'
""""

set background=dark
"colorscheme solarized8
colorscheme solarized
"colorscheme solarized8_high
"colorscheme solarized8_flat
let g:solarized_use16 = 1
highlight clear LineNr
highlight LineNr ctermfg=10



" jedi-vim
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0

" Tex
set conceallevel=0
hi clear texItalStyle 


" Commands
command Vimrc e ~/.vimrc
command BashProfile e ~/.bash_profile
