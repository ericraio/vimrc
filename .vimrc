set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Colors
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'altercation/vim-colors-solarized'
Plugin 'twerth/ir_black'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/molokai'
Plugin 'vim-scripts/pyte'
Plugin 'telamon/vim-color-github'
Plugin 'larssmit/vim-getafe'
Plugin 'TechnoGate/janus-colors'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'railscasts'

" Langs
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-markdown'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ajf/puppet-vim'
Plugin 'rosstimson/scala-vim-support'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-git'
Plugin 'timcharper/textile.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'mmalecki/vim-node.js'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'groenewege/vim-less'
Plugin 'wlangstroth/vim-haskell'
Plugin 'slim-template/vim-slim'
Plugin 'jimenezrick/vimerl'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'guns/vim-clojure-static'
Plugin 'elixir-lang/vim-elixir'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tpope/vim-liquid'
Plugin 'depuracao/vim-rdoc'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'vim-test/vim-test'

" Tools
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'itspriddle/ZoomWin'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ericraio/vim-rspec2'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-endwise'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/vimwiki'
Plugin 'ap/vim-css-color'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'chrisbra/NrrwRgn'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'rgarver/Kwbd.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-dispatch'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thinca/vim-visualstar'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'matze/vim-move'
Plugin 'chr4/nginx.vim'
Plugin 'spacewander/openresty-vim'

"Other Plugins
Plugin 'tpope/vim-pathogen'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

syntax on

" Easy window navigation
" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""autocmd vimenter * NERDTree

let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:gist_use_password_in_gitconfig = 1

function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
  call SyntasticCheck()
endfunction

au BufReadPost Dangerfile set syntax=ruby

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>

let NERDTreeShowHidden=1

" RSpec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set nobackup
set noswapfile
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set relativenumber

" quickly resize windows with a vertical split:
:map - <C-W>-
:map + <C-W>+

"clearing highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>hs :nohlsearch<CR>

"SHORTCUTS
" NERDTree mappings
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>

" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

let g:move_key_modifier = 'C'
let g:ctrlp_max_depth = 40
let g:ctrlp_custom_ignore = 'node_modules\|.git'
