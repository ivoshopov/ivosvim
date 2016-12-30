set nocompatible              " be iMproved, required from Vundle
filetype off                  " required from Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'gregsexton/gitv'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" by default the Ubuntu terminal has black background while Vim is expecting
" a white one.
set background=dark

" When yaifa.vim plugin is installed expandtab is set by it. 
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 8 spaces
" When yaifa.vim plugin is install following shiftwidth is the default shiftwidth and tabstop
set shiftwidth=8
"set tabstop=4

" The following command will turn on cindent according to the filetype
filetype plugin indent on

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
map <F3> :Rgrep \<<C-R><C-W>\> *.c *.h *.cpp *.C *.H *.CPP<CR>
" Go to some word and predd F3 to search for that word in current directory
map <F2> :Grep \<<C-R><C-W>\> *.c *.h *.cpp *.C *.H *.CPP<CR>
" Go to next found word in the search
map <F5> :cn<CR>
" Go to previus found word in the search
map <F4> :cp<CR>

" Grep plugin include Egrep command which makes problem when you try to call Explorer by "E" key and Enter
" vim replay with "E464: Ambiguous use of user-defined command"
" In order to fix this wi will define command E as Explorer command is define
command! -nargs=* -bar -bang -count=0 -complete=dir	E Explore <args>

" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set up status line
set laststatus=2
set statusline=%{fugitive#statusline()}%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%v,%l/%L\ %P

" Set up vim diff to synchronized right and left vertical windows
set diffopt=filler,vertical

" Set up cscope shortcuts
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
			\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
			\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
			\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
			\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
			\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
			\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
			\:vert scs find d <C-R>=expand("<cword>")<CR><CR>
