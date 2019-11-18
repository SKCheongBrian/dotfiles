"disable vi compatibility (emulation of old bugs)
set nocompatible

"pathogen init
execute pathogen#infect()
filetype plugin indent on

"set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"curly braces auto complete maybe?
imap {<CR> {<CR>}<Esc>O

"use indentation of previous line
set autoindent
set cindent

"use intelligent indentation for C
set smartindent

"configure tabwidth and insert spaces instead of tabs
set tabstop=4		"tab width is 4 spaces
set shiftwidth=4	"indent also with 4 spaces
set expandtab		"expand tabs to spaces

"wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
set textwidth=120

"turn syntax highlighting on
set t_Co=256
syntax on

"turn line numbers and relative numbers on
set number
set relativenumber

"remapping j k as esc for insert mode
imap jk <Esc>

"highlight matching braces
set showmatch

"some format thing
set formatoptions+=r

"intelligent comments
set comments=sl:/*,mb:**,elx:*/

"pressing <F2> to save file in normal mode
nmap <F2> :w<CR>

"pressing <F2> to save file in insert mode
imap <F2> <ESC>:w<CR>i

"setting colour theme
colorscheme tomorrow-night
