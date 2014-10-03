set mouse=a
syntax on
set syntax=on
set number
set tabstop=4
set showmatch
set cursorline
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
filetype on
au BufWinEnter * let w:m2=matchadd('Tab', '\t', -1)
au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
highlight Tab ctermbg=none guibg=none
highlight Space ctermbg=darkred guibg=darkred
set list listchars=tab:▸\ ,trail:·
