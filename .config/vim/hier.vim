let s:share_dir = $HOME .. '/.local/share/vim'
let s:state_dir = $HOME .. '/.local/state/vim'

let &packpath = s:share_dir .. ',' .. &packpath
let &packpath = &packpath .. ',' .. s:share_dir .. '/after'

let &viminfofile = s:state_dir .. '/viminfo'
let &directory   = s:state_dir .. '/swap//'
let &backupdir   = s:state_dir .. '/backup//'
let &undodir     = s:state_dir .. '/undo//'
let g:netrw_home = s:state_dir

call mkdir(fnamemodify(&viminfofile, ':p:h'), 'p')
call mkdir(expand(&directory), 'p')
call mkdir(expand(&backupdir), 'p')
call mkdir(expand(&undodir), 'p')
call mkdir(expand(g:netrw_home), 'p')
