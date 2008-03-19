"""""""""""""""""""""""""""""""""""""""
" .vimrc configuration file
" Author Jo�o Trindade
"""""""""""""""""""""""""""""""""""""""
" Heavily inspired in:
" http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin. Required for latex.
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader to '\'
let mapleader = "\\"
let g:mapleader = "\\"

"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

"Switch to current dir
map <leader>CD :cd %:p:h<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Select all and copy to + buffer
map <leader>sa :%y +<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"By far my favourite
color desert

"Set bg to dark
set background=dark

"Font type and size
"set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
set guifont=Monospace\ 10

"set the right enconding
set encoding=latin1

"set Pattern matching highlight
hi MatchParen guifg=#000000 guibg=#D0D090

if has("gui_running")
    set guioptions-=T
endif

"Highlight current
if has("gui_running")
  set cursorline
  hi cursorline guibg=black
endif

"Highlight spaces at the end of lines
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"When moving vertical, start scrolling 7 lines before reaching the extremity
set so=7

"Turn on WiLd menu - command-line completion operates in an enhanced mode.
set wildmenu

"Always show current position
set ruler

"The commandbar is 1 line high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase

"You will see results while you type
set incsearch

"Set magic on
set magic
"Use abreviation in the messages (like + instead of Modified)

set shortmess=at

"show matching bracets
"set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Statusline (the bar at the bottom)
"""""""""""""""""""""""""""""""
"Use statusline in every window
set laststatus=2

"Format the statusline
set statusline=\ File:\ %F%m%r%h\ %w\ \ \ Current\ dir:\%r%{getcwd()}%h
""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Use the arrows to something usefull
map <leader><right> :bn<cr>
map <leader><left>  :bp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My usual typos
iab wile while
iab wich which
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

"Set the style of the popup menu on autocomplete
set completeopt=menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"#########################################
" Plugin related
"#########################################

""""""""""""""""""""""""""""""
" Minibuffer
""""""""""""""""""""""""""""""
"Show the miniBufExplorer from the start
let g:miniBufExplorerMoreThanOne = 0

"Not using because I don't use the vertival window
    "Use a vertical windows
    "let g:miniBufExplVSplit = 5

    "Put the miniBufExplorer windows at the right
    "let g:miniBufExplSplitBelow=1

    "Maximum size of the buffer explorer window
    "let g:miniBufExplMaxSize = 15

"Still haven't discovered what it does
    "let g:miniBufExplMapWindowNavArrows = 1
    "let g:miniBufExplMapCTabSwitchBufs = 1
    "let g:miniBufExplUseSingleClick = 1
    "let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.

"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue

" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red

" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green

" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Green

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

"""""""""""""""""""""""""""""""""""
" Stolen from http://dev.gentoo.org/~bass/configs/vimrc.html
"
" Adapt the status line accourding to the window
"""""""""""""""""""""""""""""""""""
if has("autocmd")
       au FileType qf
                   \ if &buftype == "quickfix" |
                   \     setlocal statusline=%2*%-3.3n%0* |
                   \     setlocal statusline+=\ \[Compiler\ Messages\] |
                   \     setlocal statusline+=%=%2*\ %<%P |
                   \ endif

       fun! <SID>FixMiniBufExplorerTitle()
           if "-MiniBufExplorer-" == bufname("%")
                setlocal statusline=%2*%-3.3n%0*
                setlocal statusline+=\[Buffers\]
                setlocal statusline+=%=%2*\ %<%P
           endif
       endfun

       au BufWinEnter *
                   \ let oldwinnr=winnr() |
                   \ windo call <SID>FixMiniBufExplorerTitle() |
                   \ exec oldwinnr . " wincmd w"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Showmarks
""""""""""""""""""""""""""""""
if has("gui_running")
   let g:showmarks_enable=1
else
   let g:showmarks_enable=0
   let loaded_showmarks=1
endif

let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

if has("autocmd")
   fun! <SID>FixShowmarksColours()
       if has('gui')
           hi ShowMarksHLl gui=bold guifg=#a0a0e0 guibg=#2e2e2e
           hi ShowMarksHLu gui=none guifg=#a0a0e0 guibg=#2e2e2e
           hi ShowMarksHLo gui=none guifg=#a0a0e0 guibg=#2e2e2e
           hi ShowMarksHLm gui=none guifg=#a0a0e0 guibg=#2e2e2e
           hi SignColumn   gui=none guifg=#f0f0f8 guibg=#2e2e2e
       endif
   endfun
   if v:version >= 700
       autocmd VimEnter,Syntax,ColorScheme * call <SID>FixShowmarksColours()
   else
       autocmd VimEnter,Syntax * call <SID>FixShowmarksColours()
   endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Showmarks
""""""""""""""""""""""""""""""
" GIT
nmap <leader>gita <Plug>VCSAdd
nmap <leader>gitc <Plug>VCSCommit
nmap <leader>gitl <Plug>VCSLog
map <leader>gitr <Plug>VCSRevert
nmap <leader>gitu <Plug>VCSUpdate
nmap <leader>gitd <Plug>VCSVimDiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"#########################################
" End of Plugin related
"#########################################


""""""""""""" From here it isn't cleaned """"""

"IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"To solve the propleme with vim-latexsuite has with � and �
imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> \c <Plug>Traditional
map <buffer> <silent> � �
map <buffer> <silent> � �
map <buffer> <silent> � �
"imap � <Plug>Tex_MathCal
"imap � <Plug>Traditional

let g:Tex_IgnoredWarnings="Font""\n"

"Begin{itemize}
map <leader>bi o\begin{itemize}<Esc>
"End {itemize}
map <leader>ei o\end{itemize}<Esc>

"\ll para criar o pdf
"\lv para ver o pdf


let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewerCwindowHeight = 6

" if using a version 6 vim, enable folding
if version >= 600
 set foldenable
 set foldmethod=marker
endif

"Indent all lines
map <leader>ia ggVG=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set lbr
set et


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Buffer realted
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Buffer - "hide" :hide)
    map <F9> ggVGg?


    map <F10> :WMToggle<cr>

   """"""""""""""""""""""""""""""
   " Win Manager
   """"""""""""""""""""""""""""""
   let g:winManagerWidth=35
   let g:defaultExplorer=0
   let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer'
   let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'


   """"""""""""""""""""""""""""""
   " Win Manager
   """"""""""""""""""""""""""""""
   "Keys
   "<Leader>x \\Comentar | Descomendar
   "<Leader>c \\(Comentar | Descomentar) + Vai uma lina para baixo

    """"""""""""""""""""""""""""""
    " Vim Spell (no longer in plugin)
    """"""""""""""""""""""""""""""
    "they were using white on white
"    highlight PmenuSel ctermfg=black ctermbg=lightgray

if version >= 700

    "Texto em portugues
    map <leader>lpt <Esc>:setlocal spell spelllang=pt<CR>
    "Texto em Ingles
    map <leader>len <Esc>:setlocal spell spelllang=en_gb<CR>
    " toggle spelling with F4 key
    map <leader>lon :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    "Turn off spelling
    map <leader>lnon :setlocal nospell<CR>

    "Goto the next work with an error
   imap <leader>mn <Esc>]s

    "Correct the work under the cursor
    imap <leader>mm <Esc>z=

    "Add the current word to the dictionary
    imap <leader>ma <Esc>zg

    " limit it to just the top 10 items
    set sps=best,10

    "Where it should get the dictionary files
    let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

    setlocal spell spelllang=pt
    setlocal nospell
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile
set noar

"""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""
"Auto indent
set ai
"Smart indet
set si
"C-style indeting
set cindent
"Wrap lines
"set wrap

""""""""""""""""""""""""""""""
" Spell related
"""""""""""""""""""""""""""""""
highlight SpellErrors gui=underline ctermfg=Red guifg=Red

""""""""""""""""""""""""""""""
" File explorer
""""""""""""""""""""""""""""""
"Split vertically
 	let g:explVertical=1

"Window size
	let g:explWinSize=35
	let g:explSplitLeft=1
	let g:explSplitBelow=1
"Hide some files
	let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'
"Hide the help thing..
	let g:explDetailedHelp=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Apos fazer um make ou um grep, fazer \cw para navegar entre erros/resultados
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"map <leader>cw :botright cw 10<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F12>

"map <leader>tn :tabnew %<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

"Explore Fast
map <leader>ee :Explore <cr>

"Quit fast
map <leader>q :qa <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  THIS ONE IS GREAT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move a line of text using control
nmap <C-down> mz:m+<cr>`z
nmap <C-up> mz:m-2<cr>`z
vmap <C-down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-up> :m'<-2<cr>`>my`<mzgv`yo`z

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  PERL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Perl_AuthorName      = 'Jo�o Paulo Pinto Trindade'
"let g:Perl_AuthorRef       = 'Mn'
let g:Perl_Email           = 'trindade.joao@gmail.com'
let g:Perl_Company         = 'Inesc-ID - Grupo de Redes'

"Control+F9 or <leader>rr = Runs Perl Code
"Alt+F9 or <leader>rv = Checks Perl Syntax
"<leader>cu = Function Comment

function! s:MyPerlSettings()
set autowrite
"set errorformat=%f:%l:%m
set formatoptions=croq
"set keywordprg=man -S 3
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
nmap <leader>rl :call Perl_Run()<CR>
nmap <leader>cc :call Perl_Run()<CR>
"noremap :call Executor()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Or my favorite, load filetype specific settings automagically as the file loads:
augroup vimrc_filetype
autocmd!
autocmd FileType perl call s:MyPerlSettings()
"#Have to do latex
"#Have to do bash
"#Have to do vimrc
augroup end
