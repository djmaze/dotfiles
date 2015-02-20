if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" From janus
NeoBundle 'tpope/vim-sensible', 'v1.1'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim', '1.79'
NeoBundle 'scrooloose/nerdcommenter', '2.3.0'
NeoBundle 'scrooloose/nerdtree', '4.2.0'
"NeoBundle 'tpope/vim-unimpaired', '1.2'
NeoBundle 'SirVer/ultisnips', '3.0'
NeoBundle 'ervandew/supertab', '2.1'
NeoBundle 'scrooloose/syntastic', '3.5.0'
"NeoBundle 'majutsushi/tagbar', 'v2.6.1'
NeoBundle 'Lokaltog/vim-easymotion', '2.0'
"NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'tpope/vim-fugitive', 'v2.2'
NeoBundle 'vim-scripts/ZoomWin', '24@1'
NeoBundle 'jeetsukumaran/vim-buffergator', 'v2.4.0'
NeoBundle 'terryma/vim-multiple-cursors', 'v2.2'
NeoBundle 'bronson/vim-trailing-whitespace', '1.0'
" Additional
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'Keithbsmiley/investigate.vim', '1.1.4'
NeoBundle 'AndrewRadev/switch.vim', 'v0.2.0'
NeoBundle 'bling/vim-airline', 'v0.6'
NeoBundle 'tpope/vim-bundler', 'v2.0'
NeoBundle 'heartsentwined/vim-ember-script', 'v1.0.1'
NeoBundle 'heartsentwined/vim-emblem', 'v1.2.0'
NeoBundle 'greyblake/vim-preview', 'v0.8'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tpope/vim-eunuch', '16f64343eb1d37b7f42f7da6460d45262b9d68e5' " v1.1
NeoBundle 'jgdavey/vim-blockle', 'v0.4'
" Go
NeoBundle 'fatih/vim-go'
NeoBundle 'Blackrush/vim-gocode'
" Langs
NeoBundle 'kchmck/vim-coffee-script', 'v003'
NeoBundle 'tpope/vim-git', 'v6.0'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown', 'vim7.4'
NeoBundle 'tpope/vim-rails', 'v5.1'
"NeoBundle 'skwp/vim-rspec', '0.2.0'
NeoBundle 'vim-ruby/vim-ruby', 'vim7.4'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'wavded/vim-stylus', '0.9.1'
" Colors
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'tomasr/molokai'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"" Basic Setup
"set number            " Show line numbers
set ruler             " Show line and column number

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" Set leader to ","
let mapleader = ','

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>


" Map Control-# to switch tabs
map  <C-0> 0gt
imap <C-0> <Esc>0gt
map  <C-1> 1gt
imap <C-1> <Esc>1gt
map  <C-2> 2gt
imap <C-2> <Esc>2gt
map  <C-3> 3gt
imap <C-3> <Esc>3gt
map  <C-4> 4gt
imap <C-4> <Esc>4gt
map  <C-5> 5gt
imap <C-5> <Esc>5gt
map  <C-6> 6gt
imap <C-6> <Esc>6gt
map  <C-7> 7gt
imap <C-7> <Esc>7gt
map  <C-8> 8gt
imap <C-8> <Esc>8gt
map  <C-9> 9gt
imap <C-9> <Esc>9gt

""
"" Misc mappings
""

" Toggle NERDTree using leader-\n
nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" Map <Leader><Leader> to ZoomWin
nmap <leader>zw :ZoomWin<CR>

"""
""" My mappings
"""

" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

" Map Switch plugin command to "-"
nnoremap - :Switch<cr>

" Ignore files for CTRL-P, ctags etc.
set wildignore+=*.sql,*.log,bower_components,node_modules,tmp,dist,public/assets

" Integrate zeal (for documentation lookups)
"let g:investigate_command_for_ruby = '/usr/bin/zeal --query ^s'
nnoremap gz :!zeal --query "<cword>"&<CR><CR>

" Enable mouse navigation
set mouse=a

" Keep git in english (in order for fugitive to work)
let g:fugitive_git_executable = 'LANG=en_US.UTF8 git'

" Split diff views vertically
set diffopt=filler,vertical

" Set colorscheme
set t_Co=256
set background=dark
color molokai

" Use powerline fonts in airline
let g:airline_powerline_fonts = 1

" Do not show branch in airline
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'

" Save using CTRL-S
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
inoremap <c-s> <Esc>:Update<CR>
