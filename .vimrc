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
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tienle/vim-itermux'
Plug 'ervandew/supertab'
Plug 'vim-scripts/vis'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/matchit.zip'
Plug 'google/vim-jsonnet'
Plug 'williamboman/mason.nvim'

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

"-----------------------------------------------------------------------------
" Colors/ Theme
"-----------------------------------------------------------------------------
set t_Co=256

syntax enable

set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_visibility='high'
let g:solarized_termtrans=1
colorscheme solarized

set guifont=Menlo:h13

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

if !has('nvim')
  set ttymouse=xterm2
endif

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
  set statusline+=\ [%{&ff}/%Y]            " filetype
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


set nofoldenable                        "don't fold by default

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

map <M-J> :m +1 <CR>
vnoremap <M-J> dp'[V']
vnoremap <M-K> dkP'[V']

" RSI preventions
imap <silent> <M-k> _
nnoremap <M-'> ci'
imap <M-'> <Esc>ci'
nnoremap <M-"> ci"
imap <M-"> <Esc>ci"
vnoremap < <gv
vnoremap > >gv

map <Leader>nt :NERDTreeToggle<CR>

imap jj <Esc>

nnoremap gA :Ag! <cword><CR>

let MRU_Max_Entries = 400

map // <plug>NERDCommenterToggle

" Duplicate a selection in Visual mode: D
vmap D y'>p

set wildignore+=*.o,*.obj,.git

"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

" make Y consistent with C and D
nnoremap Y y$

"-----------------------------------------------------------------------------
" Ruby related
"-----------------------------------------------------------------------------
compiler rubyunit
au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'

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
"  SASS / SCSS
"  ---------------------------------------------------------------------------

au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

map <leader>o :Files<CR>
