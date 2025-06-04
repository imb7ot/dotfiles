packadd! vim-oscyank

let g:oscyank_silent = 1

if (!has('clipboard_working'))
    let s:VimOSCYankPostRegisters = ['', '+', '*']
    let s:VimOSCYankOperators = ['y', 'd']
    function! s:VimOSCYankPostCallback(event)
        if index(s:VimOSCYankPostRegisters, a:event.regname) != -1
            \ && index(s:VimOSCYankOperators, a:event.operator) != -1
            call OSCYankRegister(a:event.regname)
        endif
    endfunction
    augroup VimOSCYankPost
        autocmd!
        autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
    augroup END
endif
