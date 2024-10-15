let s:xdg_data_home  = exists('$XDG_DATA_HOME')  ? $XDG_DATA_HOME  : $HOME .. '/.local/share'
let s:xdg_state_home = exists('$XDG_STATE_HOME') ? $XDG_STATE_HOME : $HOME .. '/.local/state'
let s:xdg_cache_home = exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : $HOME .. '/.cache'

let &packpath = s:xdg_data_home .. '/vim' .. ',' .. &packpath
let &packpath = &packpath .. ',' .. s:xdg_data_home .. '/vim/after'

let &viminfofile = s:xdg_state_home .. '/vim/viminfo'
let &directory   = s:xdg_cache_home .. '/vim/swap//'
let &backupdir   = s:xdg_cache_home .. '/vim/backup//'
let &undodir     = s:xdg_cache_home .. '/vim/undo//'
let g:netrw_home = s:xdg_state_home .. '/vim'

call mkdir(fnamemodify(&viminfofile, ':p:h'), 'p')
call mkdir(expand(&directory), 'p')
call mkdir(expand(&backupdir), 'p')
call mkdir(expand(&undodir), 'p')
call mkdir(expand(g:netrw_home), 'p')
