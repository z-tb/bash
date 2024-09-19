" Set background color to dark
set bg=dark

" Set tab and shift width to 3 spaces
set ts=3         " tab stops at 3 spaces
set shiftwidth=3 " indent width when using >> or <<
set expandtab    " convert tabs to spaces

" don't clear the screen on exit
set t_ti= t_te=

" insert timestamp at cursor using F3 key in command or insert mode
nnoremap <F3> "=strftime("%Y-%m-%d").' - '.$LOGNAME.' ('.$LC_SSH_USER.') - '<CR>P
inoremap <F3> <C-R>=strftime("%Y-%m-%d").' - '.$LOGNAME.' ('.$LC_SSH_USER.') - '<CR>

" set titlebar to display the hostname and filename
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k " set title start for screen
  set t_fs=^[\ " set title finish for screen
endif
if &term == "screen" || &term == "xterm"
  set title " enable title display for screen or xterm
endif

" status line for displaying filename, columns, and lines
let hostname=system('echo -n $LOGNAME@$(/bin/hostname -s)') " get user and hostname
set laststatus=2 " always display the status line
set statusline+=%{hostname}\ %F\ %P\ %c:%l " configure status line format

" set status line color
hi statusline ctermbg=4 ctermfg=15 cterm=NONE " background color = blue, foreground = white

" for Ansible YAML files which use 2 spaces for indentation
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " set local tab options for YAML files

" Cursor highlight color
" Use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;orange\x7"

" Use a red cursor otherwise (in normal mode)
let &t_EI = "\<Esc>]12;red\x7"
silent !echo -ne "\033]12;red\007" " set initial cursor color to red

" Reset cursor color when Vim exits
autocmd VimLeave * silent !echo -ne "\033]112\007" " reset to default cursor color

" Set modeline to allow local options in files
set modeline

" Highlight search results
set hlsearch

