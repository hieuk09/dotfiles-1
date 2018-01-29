set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

" My Bundles here:
"
" original repos on github
Plug 'Lokaltog/vim-powerline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'itspriddle/vim-jquery'
Plug 'garbas/vim-snipmate'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tienle/vim-itermux'
Plug 'ervandew/supertab'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/vis'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/Rainbow-Parenthesis'
Plug 'groenewege/vim-less'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-scripts/matchit.zip'

call plug#end()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
set history=1024
set cf                                " enable error files and error jumping
set ffs=unix,dos,mac                  " support these files
filetype plugin indent on
set isk+=_,$,@,%,#,-
set modeline
set autoread                          " reload file
set tabpagemax=50                     " open 50 tabs max
set splitbelow
set splitright
if version>=730
  set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp
  set undofile
  set undolevels=1000
endif


"-----------------------------------------------------------------------------
" Colors/ Theme
"-----------------------------------------------------------------------------
set t_Co=256
if !has('mac')
  set term=xterm-256color
endif

syntax enable

set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_visibility='high'
let g:solarized_termtrans=1
colorscheme solarized
"color bocau

if !has('mac')
  set guifont=ProggyCleanTT\ 14
else
  set guifont=Menlo:h13
endif

if has("syntax")
  syntax on
endif

set hls                               " Highlighting search result

"-----------------------------------------------------------------------------
" Backup
"-----------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

"-----------------------------------------------------------------------------
" UI
"-----------------------------------------------------------------------------
set ruler                             " show cursor position all the time
set nolazyredraw
set number                            " set line number on
set wildmenu
set ch=1                              " command line height
set backspace=indent,eol,start        " backspace through everything in insert mode
set report=0                          " tell us about changes
set guioptions=aegitcm
"win 180 50
set mousehide                         " hide mouse after chars typed
set mouse=a                           " mouse in all modes
set ttymouse=xterm

map <M-Esc>[62~ <ScrollWheelUp>
map! <M-Esc>[62~ <ScrollWheelUp>
map <M-Esc>[63~ <ScrollWheelDown>
map! <M-Esc>[63~ <ScrollWheelDown>
map <M-Esc>[64~ <S-ScrollWheelUp>
map! <M-Esc>[64~ <S-ScrollWheelUp>
map <M-Esc>[65~ <S-ScrollWheelDown>
map! <M-Esc>[65~ <S-ScrollWheelDown>

if has('statusline')
  set laststatus=2                    " always show status line

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  "set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  "set statusline+=\ [%{getcwd()}]          " current dir
  "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"-----------------------------------------------------------------------------
" Visual cues
"-----------------------------------------------------------------------------
set showmatch
set incsearch
set ignorecase                        " case insensitive search
set mat=5                             " bracket blinking
set novisualbell                      " no blinking

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------------------------------------------------
" Text formatting
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set nowrap
set tabstop=2
set softtabstop=2
set nosmarttab
set formatoptions+=n
set shiftwidth=2
set encoding=utf-8
set vb t_vb=
set virtualedit=all
set textwidth=80
set smartcase
set expandtab
set list
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\`\             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen


set foldmethod=syntax
set foldnestmax=10
set nofoldenable                        "don't fold by default
set foldlevel=1
"set clipboard+=unnamed                  " yanks go on clipboard instead
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent

"-----------------------------------------------------------------------------
" Mapping keys
"-----------------------------------------------------------------------------
" remap Leader to , instead of \
let mapleader = ","

"save
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

imap <A-]> <Esc>>>i
imap <A-[> <Esc><<i

" format the entire file
map === mmgg=G`m^zz

nmap <Leader>gr :call MISC_GlobalReplace()<cr>

nmap <leader>q :bd<CR>

nmap <leader>w :w<CR>

nmap <CR> :write<CR>

map <M-J> :m +1 <CR>
vnoremap <M-J> dp'[V']
vnoremap <M-K> dkP'[V']

"move to next/previous line with same indentation
nnoremap <M-,> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
nnoremap <M-.> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^

" RSI preventions
imap <silent> <M-k> _
nnoremap <M-'> ci'
imap <M-'> <Esc>ci'
nnoremap <M-"> ci"
imap <M-"> <Esc>ci"
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> vv <C-w>v
map <Leader>nt :NERDTreeToggle<CR>

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>


"a trick for sudo save
cmap w!! w !sudo tee % >/dev/null

" map esc
"imap ;; <Esc>
imap jj <Esc>

"Expand current file's path
cnoremap <C-F> <C-R>=expand('%:p:h')<CR>

nnoremap gA :Ag! <cword><CR>

let MRU_Max_Entries = 400

nnoremap <F5> :GundoToggle<CR>

map // <plug>NERDCommenterToggle

" Duplicate a selection in Visual mode: D
vmap D y'>p

set wildignore+=*.o,*.obj,.git

"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

" Toogle buffer zoom
map <Leader>zw <C-w>o

"Remap VIM 0
noremap 0 ^
noremap ^ 0

" make Y consistent with C and D
nnoremap Y y$

" Resize splits like a boss
nnoremap <S-Up> :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <S-Down> :exe "resize " . (winheight(0) * 10/11)<CR>
nnoremap <S-Left> :exe "vertical resize " . (winwidth(0) * 10/11)<CR>
nnoremap <S-Right> :exe "vertical resize " . (winwidth(0) * 11/10)<CR>

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
" Edit .vimrc
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.hamlc setfiletype haml

"-----------------------------------------------------------------------------
" Ruby related
"-----------------------------------------------------------------------------
compiler rubyunit
au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'

let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let g:rails_ctags_arguments = "`gem env gemdir`/gems"
set tags=tags;/
let g:rails_ctags_arguments = "`gem env gemdir`/gems"

"auto update ctags after file was saved
au BufWritePost .rb,.c,.cpp,*.h silent! !ctags -R &
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/gem/**;vendor/plugins/**;coverage/**;tmp/**;rdoc/**"
let g:fuf_splitPathMatching=1

" Auto indicating changes
let g:changes_vcs_system='git'

"
" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" Powerline theme
let g:Powerline_symbols     = 'fancy'

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"  ---------------------------------------------------------------------------
"  When vimrc, either directly or via symlink, is edited, automatically reload it
"  ---------------------------------------------------------------------------
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %


"  ---------------------------------------------------------------------------
"  Other files to consider Ruby
"  ---------------------------------------------------------------------------
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby


"  ---------------------------------------------------------------------------
"  CoffeeScript
"  ---------------------------------------------------------------------------

let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

"  ---------------------------------------------------------------------------
"  SASS / SCSS
"  ---------------------------------------------------------------------------

au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

map <leader>o :Files<CR>
