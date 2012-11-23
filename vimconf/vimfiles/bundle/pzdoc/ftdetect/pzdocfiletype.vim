
au BufNewFile,BufRead *.pzdoc setlocal filetype=pzdoc fileencoding=utf-8 fileformat=unix
nmap <silent><buffer> = <Plug>VimwikiAddHeaderLevel
nmap <silent><buffer> - <Plug>VimwikiRemoveHeaderLevel
nnoremap <silent><buffer> <Plug>VimwikiAddHeaderLevel :
    \<C-U>call vimwiki#base#AddHeaderLevel()<CR>
nnoremap <silent><buffer> <Plug>VimwikiRemoveHeaderLevel :
      \<C-U>call vimwiki#base#RemoveHeaderLevel()<CR>

