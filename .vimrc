" Author : Taha Magdy

" Important paths
" $ clang -x c -v -E /dev/null
" $ g++ -Xlinker -v
" cpp inlcude: /usr/include/c++/4.2.1/

" Active Patheogen
execute pathogen#infect()

" colon commands
command REload      source ~/.vimrc
command RC          e ~/.vimrc
command BashProfile e ~/.bash_profile
command Numbers     set number!  relativenumber!
map sn  :Numbers<Cr>


" Add default buffers opens every time
" OR make a map to open them fast -> I prefers that.

" Prevent bolding
if !has('gui_running')
        set t_Co=8 t_md=
endif 

" Sets
set cm=blowfish2
set background=dark
filetype on
syntax on
set showcmd
set formatoptions-=tc
set autoindent
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
set expandtab
set tabstop=4
set hidden " change buffers without the need of saving
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
set encoding=utf-8
set fillchars+=vert:│ "Tmux uses │ (U+2502) by default while Vim uses | (U+007C).
set laststatus=0


" Remove ~
"highlight EndOfBuffer ctermfg=black guifg=black




" mappings
"=========

" no shift colon <3
" This has a side effect on every remapping using :
" convert : to ;
"nnoremap ; :
"nnoremap : ;
""""""""""

map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
map  bk   :bdelete<Cr> 
map  bkk  :bdelete!<Cr> 
map  nm   :noh<Cr>
imap nm   <Esc>:noh<Cr>
map <C-x> :TableModeToggle<CR>
map <C-c> :cd %:h<CR>
map <C-h> <C-w>>
map <C-l> <C-w><
map <C-j> <C-w>+
map <C-k> <C-w>-
" no arrows
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop> 
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>
map <C-k> <Nop>
imap jk     <Esc>

" Buffers"
map  bl :CommandTBuffer<Cr>
map s=  :set spell<Cr>
map s-  :set nospell<Cr>

" * You Complete Me 
""let g:ycm_auto_trigger = 0
"cmake -G "Unix Makefiles"
let g:ycm_clangd_binary_path ='/usr/local/opt/llvm/lib/libclang.dylib'
let g:ycm_key_invoke_completion = '<C-k>'
""let g:ycm_max_num_candidates = 15
let g:ycm_use_clangd = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion=[]    " To solve tab snipmate coflict
let g:ycm_key_list_previous_completion=[]  " To solve tab snipmate coflict
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_use_ultisnips_completer = 0
set completeopt-=preview
autocmd CompleteDone * pclose


" * IndentLine
let g:indentLine_char = '¦'
let g:indentLine_fileType = ['c', 'cpp', 'py']




" Run current Python buffer.
map rp  :!clear: python3 % \| less<Cr>
 
" * SnipMate
imap <tab> <Plug>snipMateNextOrTrigger
smap <tab> <Plug>snipMateNextOrTrigger

" * indentLine
"let g:indentLine_leadingSpaceEnabled=1
"let g:indentLine_leadingSpaceChar = '.'


" * CommandT 
" Map <C-c> to jk
let g:CommandTCancelMap=['jk', '<C-c>']

" * Taglist
" <leader> = \
let Tlist_Ctags_Cmd  ='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let Tlist_Use_Right_Window   = 1
let Tlist_Enable_Fold_Column = 0 "Disable number columns
let g:tagbar_width   = 25
map <leader>t  :Tlist<cr> 

" * GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_async = 0
set updatetime=250 
set diffopt+=vertical

" * NERDTree
command Tree e NERDTree: NONumbers


" * IndentLine
let g:indentLine_char = '¦'
let g:indentLine_fileType = ['c', 'cpp', 'py']


" * Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif"


"set background=dark
"colorscheme solarized8_flat
"let g:solarized_use16 = 1
"highlight clear LineNr
"highlight LineNr ctermfg=10



" jedi-vim
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#popup_on_dot = 0 

" Special stuff for specific filetypes 
""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.rev        set nospell
autocmd BufEnter __Tag_List__ set nospell nonumber norelativenumber
autocmd BufEnter *.mail       set nonumber norelativenumber
autocmd BufEnter *.txt        set noautoindent 
autocmd BufEnter *.snippets   set noexpandtab list
autocmd BufEnter Makefile     set noexpandtab
autocmd BufEnter *.py         set autoindent
autocmd BufEnter *.tex        set spell

" Tex
set conceallevel=0
hi clear texItalStyle 

function Bobo(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

"" Fold
augroup AutoSaveFolds
  autocmd!
  "" ?* matches any file name.
  "" starts with anychar to avoid matching empty buffers.
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

"" Colors
"   :h Pmenu to see the enitre list
"   ctermbg: bg for background
"   ctermfg: fg for background

highlight clear PmenuSel
highlight PmenuSel ctermbg=178 ctermfg=black
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=9
hi clear Pmenu
hi Pmenu ctermbg=93
hi clear LineNr
hi LineNr ctermfg=58
