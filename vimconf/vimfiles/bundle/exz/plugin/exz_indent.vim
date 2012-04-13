
""""""""""""""""""""""""""""
" Usage: 
"   :EXZ_indent_close
"   :EXZ_indent_open
"
""""""""""""""""""""""""""""


let s:old_indentkeys = ""

function! s:_close_indent()
    let s:old_indentkeys = &indentkeys
    set indentkeys=
    set noautoindent
endfunction

function! s:_open_indent()
    if s:old_indentkeys == ""
        echo "error: old indentkeys is empty"
        return 0
    endif
    set indentkeys=s:old_indentkeys
    set autoindent

endfunction

""""""""""""""""""""""""""""
" init command
""""""""""""""""""""""""""""
"command! -n=? -complete=dir -bar EXZ :call s:_close_indent('<args>')
command! -n=0 -bar ExzIndentClose :call s:_close_indent()
command! -n=0 -bar ExzIndentOpen :call s:_open_indent()


