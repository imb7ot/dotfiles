packadd! oscyank

let g:oscyank_silent = 1

if (!has('clipboard_working'))
    function! s:VimOSCYankPostCallback(event)
        if index(['y', 'd'], a:event.operator) != -1 && index(['', '+', '*'], a:event.regname) != -1
            call OSCYankRegister(a:event.regname)
        endif
    endfunction
    augroup VimOSCYankPost
        autocmd!
        autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
    augroup END
endif
