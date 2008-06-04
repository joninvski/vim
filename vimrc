"""""""""""""""""""""""""""""""""""""""
" .vimrc configuration file
"
" Author: João Trindade
" WWW: http://joaotrindade.no-ip.org
" Email: trindade.joao@gmail.com
"""""""""""""""""""""""""""""""""""""""
" Heavily inspired in:
" http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""
" Latest version, always available at:
" http://joaotrindade.no-ip.org/git/gitweb.cgi?p=vim/.git;a=summary
"""""""""""""""""""""""""""""""""""""""

" General{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=500

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

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

"Switch to current dir
map <leader>CD :cd %:p:h<cr>

"Select all and copy to + buffer
map <leader>sa :%y +<cr>

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    set titlestring+=\ -\ %{v:progname}      " program name
endif

"restore your cursor position in a file over several editing sessions.
set viminfo=!,'10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"Set visual bell (instead of the audible)
set visualbell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Colors and Fonts{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"By far my favourite
color desert

"Set bg to dark
set background=dark

"Font type and size
"set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
"set guifont=Terminus\ 8
set guifont=Monospace\ 10

"set the right enconding
set encoding=latin1

"set Pattern matching highlight
hi MatchParen guifg=#000000 guibg=#D0D090

if has("gui_running")
    set guioptions=m
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
"""""""""""""""""""""""""""""""""""""""""""}}}

" FileTypes{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This file is a python and django filetype needed to activate django
"snippets
autocmd BufNewFile,BufRead *.py setlocal ft=python.django
autocmd BufNewFile,BufRead *.html setlocal ft=html.django
autocmd BufNewFile,BufRead *.tex setlocal ft=tex
"""""""""""""""""""""""""""""""""""""""""""}}}

" IDE Related{{{
" bind ctrl+space for omnicompletion (like eclipse)
inoremap <Nul> <C-x><C-o>
"""""""""""""""""""""""""""""""""""""""""""}}}

" VIM userinterface{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"When moving vertical, start scrolling 7 lines before reaching the extremity"
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Statusline (the bar at the bottom){{{
"""""""""""""""""""""""""""""""
"Use statusline in every window
set laststatus=2

"Format the statusline
set statusline=\ File:\ %F%m%r%h\ %w\ \ \ Current\ dir:\%r%{getcwd()}%h%=\L%-5l\ \C%-4c%5p%%\ [%L\ \lines]
""""""""""""""""""""""""""""""""""}}}

" Moving around and tabs{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Use the arrows to something useful
map <leader><right> :bn<cr>
map <leader><left>  :bp<cr>

"Move a line of text using control
nmap <C-down> mz:m+<cr>`z
nmap <C-up> mz:m-2<cr>`z
vmap <C-down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-up> :m'<-2<cr>`>my`<mzgv`yo`z
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" General Abbreviations  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My usual typos
iab wile while
iab wich which
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" AutoComplete{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"

    else
        return "\<Tab>"
    endif
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>


"Set the style of the popup menu on autocomplete
set completeopt=menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Snippets{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A basic snippet can save you a lot of typing. Define a word trigger and on
"insertion it will be expanded to the full snippet.
let g:snippetsEmu_key = "<S-Tab>" "Use snippets with Shift+Tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Command-line config{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Useful shortcuts{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indent all lines
map <leader>ia mzggVG='z

"Switch to current dir
map <leader>CD :cd %:p:h<cr>

"Select all and copy to + buffer
map <leader>sa :%y +<cr>

" Buffer - "hide" :hide)
map <F9> mzggVGg?'z

"Explore Fast
map <leader>ee :Explore <cr>

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F12>

"Quit fast
map <leader>q :qa <cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Text options{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"A <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set smarttab

"linebreak
set lbr
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Fold"{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if using a version 6 vim, enable folding
if version >= 600
    set foldenable
    set foldmethod=marker"
endif

"Keys
"  * zf create the fold, useful for manual and marker methods. Select any piece of text, [press v or shift-v, then use arrow keys], and then press zf. It will place the markers around the fold for you in marker mode; in case of manual, it will store fold location in memory. Remember f by saying this command "forms" the fold, or just remember fold :-)
"  * zc close the fold at the cursor.
"  * zo open the fold at the cursor.
"  * zr  increment the fold level by one, so if all classes are folded, they will opened, but function definitions will be kept folded.
"  * zm reverse of the above, if one or more function folds are open, they will be closed, but classes will be kept open.
"  * zR open all folds.
"  * zM close all folds.
"  * zj and zk can be used to jump from one fold to another.  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Vim Spell {{{
""""""""""""""""""""""""""""""
if version >= 700

    "Portuguese dictionary
    map <leader>lpt <Esc>:setlocal spell spelllang=pt<CR>

    "English dictionary
    map <leader>len <Esc>:setlocal spell spelllang=en_gb<CR>

    " toggle spelling with <leader>lon
    map <leader>lon :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

    "Turn off spelling
    map <leader>loff :setlocal nospell<CR>

    "Goto the next work with an error
    map <leader>ln <Esc>]s

    "Correct the work under the cursor
    map <leader>lm <Esc>z=

    "Add the current word to the dictionary
    map <leader>la <Esc>zg

    " limit it to just the top 10 items
    set sps=best,10

    "Where it should get the dictionary files
    let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

    "Mark bad spelled words with red
    highlight SpellErrors gui=underline ctermfg=Red guifg=Red

    setlocal spell spelllang=pt
    setlocal nospell
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Files and backups{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup

"Don't create a backup when overwriting a file
set nowb

set noswapfile

"Autoread a file when it has been changed
set ar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Indent {{{
"""""""""""""""""""""""""""""""
"Auto indent
set ai
"Smart indent
set si
"C-style indenting
set cindent
"Wrap lines
"set wrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Grep {{{
""""""""""""""""""""""""""""""""""""""
"IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -inH\ $*
""""""""""""""""""""""""""""""""""""""}}}

" Quickfix {{{
""""""""""""""""""""""""""""""""""""""
map <leader>n :cn<cr>
map <leader>m :cp<cr>
map <leader>w :cw 8<cr>
""""""""""""""""""""""""""""""""""""""}}}

" Plug-in related {{{1
"#########################################

" Minibuffer{{{
""""""""""""""""""""""""""""""
"Show the miniBufExplorer from the start
let g:miniBufExplorerMoreThanOne = 0

"Not using because I don't use the vertical window
"Use a vertical windows
"let g:miniBufExplVSplit = 5

"Put the miniBufExplorer windows at the right
"let g:miniBufExplSplitBelow=1

"Maximum size of the mini buffer explorer window
"let g:miniBufExplMaxSize = 15

"Still haven't discovered what it does
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1

" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 1

" If you would like to single click on tabs rather than double clicking on them to go to the selected buffer.
let g:miniBufExplUseSingleClick = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue

" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red

" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green

" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Green

let g:bufExplorerSortBy = "name"

"autocmd BufRead,BufNew :call UMiniBufExplorer

"""""""""""""""""""""""""""""""""""
" Stolen from http://dev.gentoo.org/~bass/configs/vimrc.html
"
" Adapt the status line according to the window
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
            setlocal statusline=\[Buffers\]
        endif
    endfun

    au BufWinEnter *
                \ let oldwinnr=winnr() |
                \ windo call <SID>FixMiniBufExplorerTitle() |
                \ exec oldwinnr . " wincmd w"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Showmarks {{{
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" GIT{{{
""""""""""""""""""""""""""""""
nmap <leader>gita <Plug>VCSAdd
nmap <leader>gitc <Plug>VCSCommit
nmap <leader>gitl <Plug>VCSLog
map <leader>gitr <Plug>VCSRevert
nmap <leader>gitd <Plug>VCSVimDiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Win Manager {{{
""""""""""""""""""""""""""""""

"Split vertically
let g:explVertical=1

let g:winManagerWidth=30
let g:defaultExplorer=0
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer'

"Hide some files
let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

"Hide the help thing..
let g:explDetailedHelp=0

map <F10> :WMToggle<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Latex related {{{
""""""""""""""""""""""""""""""""""""""

"To solve the propleme with vim-latexsuite has with ã and â
imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
"imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> \c <Plug>Traditional
map <buffer> <silent> é é
map <buffer> <silent> á á
map <buffer> <silent> ã ã
"imap ã <Plug>Tex_MathCal
"imap é <Plug>Traditional

"Ignore some warnings
let g:Tex_IgnoredWarnings="Font""\n"

"Shortcut to Begin{itemize}
map <leader>bi o\begin{itemize}<Esc>
"shortcut to End {itemize}
map <leader>ei o\end{itemize}<Esc>

" Create PDFs
let g:Tex_DefaultTargetFormat = "pdf"

let g:Tex_ViewerCwindowHeight = 6

"Ignore pdf viewer error output
let g:Tex_ViewRule_pdf = 'xpdf 2> /dev/null'

"Don't use imap expansions (To change in future)
let g:Imap_FreezeImap = 1

"Use \ll to create the pdf
"Use \lv to see the pdf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Yank Ring {{{
""""""""""""""""""""""""""""""
map <leader>p :YRShow<cr>
""""""""""""""""""""""""""""""}}}

" Project{{{
""""""""""""""""""""""""""""""
nmap <silent> <Leader>P :Project<CR>
""""""""""""""""""""""""""""""}}}

" CloseTag{{{
""""""""""""""""""""""""""""""
"Use <Control+_> to close tag
:au Filetype html,xml,xsl source ~/.vim/macros/closetag.vim
""""""""""""""""""""""""""""""}}}

" Taglist{{{
""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"If it is a latex file
let s:tlist_def_tex_settings = 'tex;s:section;c:chapter;l:label;r:ref'
""""""""""""""""""""""""""""""}}}

" ScmDiff{{{
""""""""""""""""""""""""""""""
" Use git to do the diff with Control+D <C-D>
if !exists("g:SCMDiffCommand")
    let g:SCMDiffCommand = 'git'
endif
""""""""""""""""""""""""""""""}}}
"######################################### End of Plug-in related 1}}}


"-----------------------------------------------------------------------
" vim: set shiftwidth=4 softtabstop=4 expandtab tw=72                  :
