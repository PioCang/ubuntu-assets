set number
set cursorline

syntax enable
set encoding=utf8
set ffs=unix,dos,mac

set backspace=eol,start,indent

" search
set ignorecase
set smartcase
set incsearch

" brackets
set showmatch
set mat=2

" numpad support
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OQ /
inoremap <Esc>OR *
inoremap <Esc>Ol +
inoremap <Esc>OS -
inoremap <Esc>OM <Enter>





"" Turn on to use spaces
"set smarttab
"set autoindent
"set expandtab
"set shiftwidth=4
"set tabstop=4
"set ai
"set si

" Turn on to use tabs
set noet ci pi sts=0 sw=4 ts=4
augroup python
    autocmd!
    autocmd FileType python setlocal noet ts=4
augroup end




" our c++ codes use 2 spaces for tabs
"augroup tabSettingsForCxxFile
"    autocmd!
"    autocmd BufRead,BufNewFile *.cxx,*.h,*.deps,*.c setlocal ts=2 sw=2
"augroup END


" wrapped lines are treated as separate lines by j and k
map j gj
map k gk

" :Wq = :wq | :W = :w | :Q = :q | :Qa = :qa
command! -complete=file -bang -nargs=? W :w<bang> <args>
command! -complete=file -bang -nargs=? Wq :wq<bang> <args>
command! -bang Q :q<bang>
command! -bang Qa :qa<bang>

" indenting
vnoremap < <gv
vnoremap > >gv

" statusline / command line
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=1
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

set t_Co=256
" To update the status line, so that you have the colourful status bar. If it is not set you will not see any change when you start up vim.
" Set a status line
set laststatus=2
 
" Set encoding so that your fonts look okay.
set nowrap
set encoding=utf-8
  
execute pathogen#infect()
syntax on
filetype plugin indent on
   
" Enable powerline fonts
let g:airline_powerline_fonts = 1
colorscheme base

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='simple'
" F8 to toggle highlight.
set hlsearch
let hlstate=0
nnoremap <F8> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" F7 to toggle indent view.
set nolist
let liststate=0
nnoremap <F7> :if (liststate%2 == 0) \| set list \| else \| set nolist \| endif \| let liststate=liststate+1<cr>

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


"for folding
set foldmethod=manual

"for 80 column limit
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"
"function CSVTableFunc(command)
"    let cursor = getpos('.')
"    let l:winview = winsaveview()
"    execute '"normal! ggVG"
"    "normal! ggVG
"    execute a:command
"    call setpos('.', cursor)
"    call winrestview(l:winview)
"endfunction
"
"function XMLAlign()
"    let cursor = getpos('.')
"    let l:winview = winsaveview()
"    :w
"    normal(ggVGd)
"    :read !python ~/.vim/bundle/xml-aligner/xml-aligner.py %
"    normal(ggdd)
"    call setpos('.', cursor)
"    call winrestview(l:winview)
"endfunction
"
"let mapleader=" "
"map <leader>a :call XMLAlign()<CR>
"
"set filetype=txt
