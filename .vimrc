"REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
filetype indent on

"IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"To solve the propleme with vim-latexsuite has with ã and â
imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> \c <Plug>Traditional
map <buffer> <silent> é é
map <buffer> <silent> á á
map <buffer> <silent> ã ã
"imap ã <Plug>Tex_MathCal
"imap é <Plug>Traditional

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
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"By far my favourite
color desert

"Set bg to dark
set background=dark

"set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
set encoding=latin1

"Pattern matching
hi MatchParen guifg=#000000 guibg=#D0D090

if has("gui_running")
    set guioptions-=T
endif

"Espaços no fim e inicio da linha
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

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

""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/home/joao.trindade/', "~/", "g")
    return curdir
endfunction

"Format the statusline
set statusline=\ File:\ %F%m%r%h\ %w\ \ \ Current\ dir:\%r%{CurDir()}%h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Number of characters from the right window border where wrapping starts.
"set wrapmargin=1

"Set 7 lines to the cursors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
"set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
"You will see results while you type
set incsearch

"Set magic on
set magic

"Short messages .. to avoid.. press a key prompt
set shortmess=at

"No sound on errors.
" set noerrorbells
" set novisualbell
" set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

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

    "Use the arrows to something usefull
    map <leader><right> :bn<cr>
    map <leader><left>  :bp<cr>

    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplorerMoreThanOne = 0
    let g:miniBufExplModSelTarget = 0
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplVSplit = 25
    let g:miniBufExplSplitBelow=1
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
    map <leader>mn <Esc>]s
    "Correct the work under the cursor
    map <leader>mm <Esc>z=
    "Add the current word to the dictionary
    map <leader>ma <Esc>zg

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
" Moving around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart way to move btw. windows
map <M-down> <C-W>j
map <M-up> <C-W>k
map <M-right> <C-W>l
map <M-left> <C-W>h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

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

"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

"Switch to current dir
map <leader>CD :cd %:p:h<cr>

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"set cursorline
"hi cursorline guibg=#333333
"hi CursorColumn guibg=#333333
"
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
let g:Perl_AuthorName      = 'João Paulo Pinto Trindade'
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

":set  dictionary="/usr/dict/words"    
