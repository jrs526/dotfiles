set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" General Purpose
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'

" Scala
Plugin 'derekwyatt/vim-scala'

" Coffee
Plugin 'kchmck/vim-coffee-script'

" C Family
Plugin 'rhysd/vim-clang-format'

" Go
Plugin 'dgryski/vim-godef'

" JavaScript
Plugin 'hotoo/jsgf.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'ternjs/tern_for_vim'
Plugin 'maksimr/vim-jsbeautify'

" TypeScript
Plugin 'leafgarland/typescript-vim.git'
 
" Java
Plugin 'artur-shaik/vim-javacomplete2'


call vundle#end()

colorscheme slate

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

set laststatus=2
set showtabline=2
set hidden

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>S :s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>e :e 
nmap <Leader>q :bd<CR>
nnoremap <Leader>n :set number!<CR> 
nnoremap <Leader>c :set colorcolumn=81<CR> 
nnoremap <Leader>C :set colorcolumn=0<CR> 
nnoremap <Leader>k :NERDTreeTabsToggle<CR>
nnoremap <Leader><Leader> :bnext<CR>
nnoremap <C-a> ^
nnoremap <C-k> d$

set guifont=Monaco\ for\ Powerline:h12
set mouse=a
set ttymouse=xterm2
set autochdir
set guitablabel=\[%N\]\ %t\ %M

au FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
au BufNewFile,BufRead,BufEnter *.js,*.jsx set omnifunc=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.js,*.jsx let g:tern_map_keys=1
au BufNewFile,BufRead,BufEnter *.js,*.jsx let g:tern_show_argument_hints="on_hold"

au BufNewFile,BufRead,BufEnter *.go let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
\ ],
\ 'sro' : '.',
\ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
\ },
\ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
\ },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }

" useful replacements
" %s/function \(.*\)(\(.*\)) {/const \1 = (\2) => {/g
" %s/    };\n};/});/g
" %s/=> {\n    return {/=> ({/g
" %s/=> {\n    return /=> /g
