" pathogen is in that makes plugin installation easy
execute pathogen#infect()

" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" ev will open vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source my vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>


" Press Ctrl+h to switch to the left tab
map <C-h> gT
" Press Ctrl+l to switch to the right tab
map <C-l> gt

" Go to some word and predd F3 to search for that word recursively
map <F3> :noautocmd Grep \<<C-R><C-W>\> *.c *.h *.cpp *.C *.H *.CPP **/*.c **/*.h **/*.cpp **/*.C **/*.H **/*.CPP<CR>
" Go to some word and predd F3 to search for that word in current directory
map <F2> :noautocmd Grep \<<C-R><C-W>\> *.c *.h *.cpp *.C *.H *.CPP<CR>
" Go to next found word in the search
map <F5> :cn<CR>
" Go to previus found word in the search
map <F4> :cp<CR>

" Grep plugin include Egrep command which makes problem when you try to call Explorer by "E" key and Enter
" vim replay with "E464: Ambiguous use of user-defined command"
" In order to fix this wi will define command E as Explorer command is define
command! -nargs=* -bar -bang -count=0 -complete=dir	E Explore <args>