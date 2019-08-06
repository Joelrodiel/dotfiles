filetype plugin indent on

set tabstop=4

set shiftwidth=4

set expandtab
execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd VimEnter * ColorToggle

set timeout timeoutlen=300 " For those pesky double keys

imap <C-c> <C-o>daw
imap jj <Esc>
imap oo <C-o>o
map <F2> :w<CR>
imap <F2> <Esc>:w<CR>
map <F3> :wq<CR>
imap <F3> <Esc>:wq<CR>
map <F4> :q<CR>
map <F9> :q!<CR>
imap <F9> <Esc>:q!<CR>
