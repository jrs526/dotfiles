set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" General Purpose
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-abolish'

" Scala
Plugin 'derekwyatt/vim-scala'

" Coffee
Plugin 'kchmck/vim-coffee-script'

" C Family
Plugin 'rhysd/vim-clang-format'

" JavaScript
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'ternjs/tern_for_vim'
Plugin 'maksimr/vim-jsbeautify'

call vundle#end()

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim

filetype plugin indent on
syntax on
set number
set softtabstop=4 shiftwidth=4 expandtab

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>S :s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>e :tabedit 
nnoremap <Leader>n :set number!<CR> 
nnoremap <C-a> ^
nnoremap <C-k> d$

set guifont=Monaco:h12

au BufNewFile,BufRead,BufEnter *.js,*.jsx set omnifunc=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.js,*.jsx let g:tern_map_keys=1
au BufNewFile,BufRead,BufEnter *.js,*.jsx let g:tern_show_argument_hints="on_hold"

