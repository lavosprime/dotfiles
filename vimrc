set nocompatible

" Plugins

"" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Specify plugin directory
call plug#begin('~/.vim/plugged')

"" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
"" Smart hybrid/absolute line number toggling
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"" Highlight and strip trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
"" AOSP-specific syntax highlighting
Plug 'rubberduck203/aosp-vim'
"" Rust language syntax highlighting
Plug 'rust-lang/rust.vim'
"" Easy comment manipulation
Plug 'tpope/vim-commentary'
"" Repetition of custom commands
Plug 'tpope/vim-repeat'
"" Sensible defaults
Plug 'tpope/vim-sensible'
"" Easy delimiter/XML manipulation
Plug 'tpope/vim-surround'
"" Jump between source and headers
Plug 'vim-scripts/a.vim'

"" TODO evaluate/troubleshoot/describe
""" 'bling/vim-bufferline'
""" 'ctrlpvim/ctrlp.vim'
""" 'edsono/vim-matchit'
""" 'edkolev/tmuxline.vim'
""" 'edkolev/promptline.vim'
""" 'elzr/vim-json'
""" 'honza/vim-snippets'
""" 'jlanzarotta/bufexplorer'
""" 'jlfwong/vim-mercenary'
""" 'junegunn/vim-easy-align'
""" 'justimk/vim-sneak'
""" 'kien/ctrlp.vim'
""" 'lervag/vimtex'
""" 'ludovicchabant/vim-lawrencium'
""" 'majutsushi/tagbar'
""" 'mhinz/vim-signify'
""" 'octol/vim-cpp-enhanced-highlight'
""" 'plasticboy/vim-markdown'
""" 'powerline/powerline'
""" 'scrooloose/nerdcommenter'
""" 'scrooloose/nerdtree'
""" 'SirVer/utilisnips'
""" 'sjl/gundo.vim'
""" 'tmux-plugins/vim-tmux'
""" 'tpope/vim-abolish'
""" 'tpope/vim-fugitive'
""" 'tpope/vim-sleuth'
""" 'tyru/open-browser.vim'
""" 'Valloric/YouCompleteMe'
""" 'vim-airline/vim-airline'
""" 'vim-airline/vim-airline-themes'
""" 'vim-ctrlspace/vim-ctrlspace'
""" 'vim-syntastic/syntastic'

"" Initialize vim-plug
call plug#end()



" Appearance

"" Mark the 80th character in the line
set colorcolumn=80
"" Show hybrid line numbers (augmented by numbertoggle)
set number relativenumber
"" Show status bars on all windows
set laststatus=2
"" Highlight the line the cursor is on
set cursorline
"" Don't show mode on last line (TODO after powerline installation)
" set noshowmode

"" Solarized color scheme
colorscheme solarized
syntax enable
if $LAVOSPRIME_SOLARIZED == 'dark'
  set background=dark
endif
if $LAVOSPRIME_SOLARIZED == 'light'
  set background=light
endif


" Behavior

"" Default tab size = 2
set shiftwidth=2
set tabstop=2
set softtabstop=2
"" Spaces for indentation
set expandtab
"" Auto indent based on filetype
set autoindent
filetype plugin indent on
"" Backspace over autoindents, line breaks, and start of insert
set backspace=indent,eol,start
"" Don't redraw screen while executing macros
set lazyredraw
"" Temporarily jump to matching bracket on bracket insert
set showmatch


"""
" Legacy stuff
" TODO: Port all this stuff
"""

" filetype overrides
"" TODO install markdown plugin
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"" TODO unneeded? jflex for cse401
" augroup filetype
"   au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex
" augroup END
" au Syntax jflex so ~/.vim/syntax/jflex.vim


" fugitive
let g:signify_vcs_list = [ 'git' ]
" set statusline+=%t%{fugitive#statusline()}


" airline
let g:airline_powerline_fonts = 1


" syntastic
"" TODO
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:airline#extensions#syntastic#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = '-std=c++14'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" YouCompleteMe
let g:ycm_rust_src_path = '~/.local/share/rust/rustc-1.6.0/src'

