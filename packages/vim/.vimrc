" .vimrc

" Syntax highlighting
syntax on

" Indentation
set smarttab        " Insert 'tabstop' number of spaces when 'tab' key is pressed
set shiftwidth=4    " When shifting indent x number of spaces
set tabstop=4       " Indent using x number of spaces
set expandtab       " Convert tabs to spaces
set autoindent      " New lines inherit indentation
filetype plugin on  " Turn on filetype plugin
filetype indent on  " Turn on filetype indention plugin

" Search
set hlsearch        " Search highlighting
set ignorecase      " Ignore case when searching
set smartcase       " Automatically make search case sensitive when using upper case letters

" Text Rendering
" set nowrap          " No text wrapping
set scrolloff=3     " Number of lines between cursor and top and bottom of pages
set encoding=utf-8  " Use utf-8 encoding

" UI
set laststatus=2    " Always display status bar
set cmdheight=2     " Height of command bar
set ruler           " Always show cusor position
set wildmenu        " Display command line's tab complete options as a menu
" set mouse=a         " Enable mouse for scrolling and resizing
set title           " Set the window's title, reflecting the file currently being edited
set magic           " Allows regular expressions
set showmatch       " Show matching brackets

" Colors & Fonts
syntax enable       " Syntax highlighting

" Misc
set backspace=indent,eol,start

" Command Mappings

" Write file you forgot to open with sudo
cmap w!! w !sudo tee > /dev/null %
