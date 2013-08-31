
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! g:DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
map <leader>s :call g:DeleteTrailingWS()<CR>

