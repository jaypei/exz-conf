
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! g:DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
  echo "Trailing white spaces has been delete."
endfunc

map <silent> <leader>s :call g:DeleteTrailingWS()<CR>

