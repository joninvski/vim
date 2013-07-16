"""""""""""""""""""""""""""""""""""""""
" .vimrc configuration file
"
" Author: João Trindade
" WWW: http://thisblog.runsfreesoftware.com
" Email: trindade.joao@gmail.com
"""""""""""""""""""""""""""""""""""""""
" Heavily inspired in:
" http://amix.dk/vim/vimrc.html
"
" Thanks for bartekd for suggesting vim-addon-manager
" https://github.com/bartekd/vim-configuration
"""""""""""""""""""""""""""""""""""""""
" Latest version, always available at:
" https://github.com/joninvski/vim
"""""""""""""""""""""""""""""""""""""""

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256

" First install plugins via {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'a.vim'
Bundle 'xoria256.vim'
Bundle 'Xoria256m'
Bundle 'ack.vim'
Bundle 'badwolf'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'Raimondi/delimitMate'
Bundle 'DoxygenToolkit.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'Nazca'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-repeat'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'joninvski/vim-scala',
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'guns/jellyx.vim'
Bundle 'YankRing.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of
" unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}



" General{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

" See list chars (newlines, tabs, etc) (key f5 to turn on off)
" Use the same symbols as TextMate for tabstops and EOLs
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬

" Sets how many lines of history VIM to remember
set history=500

" Auto indent - Automatically set the indent of a new line
set ai
" Smart indent (not used when cident is on)
set si

"Enable filetype plugin. Required for lots of plugins
filetype indent on
filetype plugin on

"Set to auto read when a file is changed from the outside
set autoread

"Fix syntax breaks
syntax sync minlines=5000

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader to '\'
let mapleader = "\\"
let g:mapleader = "\\"

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                     " file name
    set titlestring+=%h%m%r%w                " flags
    set titlestring+=\ -\ %{v:progname}      " program name
endif

"set the right enconding
"set encoding=latin1 # Usefull for starting latex files
set encoding=utf-8

"restore your cursor position in a file over several editing sessions.
set viminfo=!,'10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"Set visual bell (instead of the audible)
set visualbell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" F# keys (top keyboard keys){{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :GundoToggle<CR>
nmap <silent> <F4> :TlistToggle<CR>
nmap <silent> <F5> :set invlist<CR>:set list?<CR>
nmap <silent> <F6> :set invwrap<CR>:set wrap?<CR>
nmap <silent> <F7> :set invhls<CR>:set hls?<CR>
nmap <silent> <F8> :call BufferList()<CR>

" Buffer - "hide" :hide)
map <F9> mzggVGg?'z

" Paste toggle - when pasting something in, don't indent. Only use it when in insert mode
set pastetoggle=<F12>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" FileTypes{{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" More specific for c and cpp{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=8
endfunction

au FileType c,cpp call GnuIndent()
au FileType c,cpp set foldmethod=syntax
 " use indentation of previous line
au FileType c,cpp set autoindent
  " use intelligent indentation for C
au FileType c,cpp set smartindent
" intelligent comments
au FileType c,cpp set comments=sl:/*,mb:\ *,elx:\ */
"""""""""""""""""""""""""""""""""""""""""""}}}

" More specific for java{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nothing for now
"""""""""""""""""""""""""""""""""""""""""""}}}

" More specific for python{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nothing for now
"""""""""""""""""""""""""""""""""""""""""""}}}
"""""""""""""""""""""""""""""""""""""""""""1}}}

" VIM userinterface{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"When moving vertical, start scrolling 10 lines before reaching the extremity"
set so=10

"Turn on WiLd menu - command-line completion operates in an enhanced mode.
set wildmenu

"Always show current position
set ruler

"The commandbar is 1 line high
set cmdheight=1

"Show line number
"Don't forget you can go to line X with :X or XG
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
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

" Set files to ignore in searches
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc,*.class,*/doc/*,*/target/*
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
nnoremap <leader><right> :bnext<cr>
nnoremap <leader><left>  :bprev<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h  :bprev<cr>

"Me being brave
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" jk in insert mode is now esc
inoremap jk <esc>
" jk in command mode is now esc
cnoremap jk <esc>

" <esc> no longer escapes to normal mode
" COMMENT AS TRAINING WHEELS NO LONGER REQUIRED
" inoremap <esc> <nop>
" vnoremap <esc> <nop> " Use shift+v to exit visual mode


" Up and down (k and j) move through wrapped lines
noremap j gj
noremap k gk
" Up and down (gk and gj) move through true lines
" (as opossed to wrapped " lines)
noremap gj j
noremap gk k

" Move to the end of the line
nnoremap L $
vnoremap L $
" Move to the beginning of the line
nnoremap H ^
vnoremap H ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" General Abbreviations  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My usual typos
iab wile while
iab wich which
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" AutoComplete and omni completion{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

"" supertab
let g:SuperTabCrMapping = 0
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

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
nnoremap <leader>ia gg=G``

"Switch to current dir
nnoremap <leader>CD :cd %:p:h<cr>

"Select all and copy to + buffer
nnoremap <leader>sa :%y +<cr>

"Quit fast
noremap <leader>q :qa <cr>

" Create etags for quick reference with control+5
map <leader>tag :!etags -R --exclude=syntastic_lib --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Text options{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab           " When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set shiftwidth=4        " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set tabstop=4           " Set tabstop to tell vim how many columns a tab counts for.
set softtabstop=4       " Set softtabstop to control how many columns vim uses when you hit Tab in insert mode. If softtabstop equals tabstop and expandtab is not set, vim will use tabs. When expandtab is set, vim will always use the appropriate number of spaces.

" A <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set smarttab

"linebreak
set lbr                 " Breaks lines at words not at characters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Fold"{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if using a version 6 vim, enable folding
set nofoldenable
au FileType tex set foldenable
au FileType vim set foldenable
au FileType vim set foldmethod=marker
au FileType py,python set foldmethod=indent

"Keys
"  * za toggles current fold on/off
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

    "Goto the next word with an error
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
" Make those folders automatically if they don't already exist.
let s:localscriptsdir = expand($HOME . '/.vim')
silent execute '!mkdir -p ' . s:localscriptsdir . '/tmp/{backup,view,tmp,undo}'

" hide buffers when not displayed
set hidden
set backup                            " Enable creation of backup file.
set noswapfile                        " No need for a swap file
set backupdir=$HOME/.vim/tmp/backup// " Where backups will go.
set directory=$HOME/.vim/tmp//        " Where temporary files will go.
set viewdir=$HOME/.vim/tmp/view//

if version >= 730
    set undodir=$HOME/.vim/tmp/undo// " undo files
    set undofile
    set undolevels = 1000             " maximum number of changes that can be undone
    set undoreload = 10000            " maximum number lines to save for undo on a buffer reload
endif

"Autoread a file when it has been changed
set ar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Grep {{{
""""""""""""""""""""""""""""""""""""""
"IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -inH\ $*
let Grep_Skip_Dirs = 'CVS .svn .git build'
let Grep_Skip_Files = '*.bak *~ *tags *TAGS *.orig syntastic_lib/*'
map <C-f> :Rgrep<CR>
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>

" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <leader>g :call VisualSearch('gv')<CR>
map <leader>f :vimgrep // **/*<left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
""""""""""""""""""""""""""""""""""""""}}}

" Quickfix {{{
""""""""""""""""""""""""""""""""""""""
noremap <leader>n :cn<cr>
noremap <leader>m :cp<cr>
noremap <leader>w :cw 8<cr>
""""""""""""""""""""""""""""""""""""""}}}

" Plug-in related {{{1
"#########################################

" Showmarks {{{
""""""""""""""""""""""""""""""
" These are the bookmarks that show up at the left
let g:showmarks_marks="abcdefghijklmnopqrstuvwxyz"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Fugitive{{{
""""""""""""""""""""""""""""""
" Check the function of :Gedit at
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" (great command)
"
" You can add/unstage files at :Gstatus buffer with '-' key. To add only
" part (patch) use the 'p' key. 'C' key commits it. Check it at:
" http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/

" When viewing a with Gdiff use diffget or diffput to make partial
" (patch) adds to the index file. More info at:
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
nnoremap <leader>gitd :Gdiff<cr>
nnoremap <leader>gits :Gstatus<cr>
nnoremap <leader>gitw :Gwrite<cr>
nnoremap <leader>gita :Gwrite<cr>
nnoremap <leader>gitb :Gblame<cr>
"nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gitc :Gcommit<cr>
"nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gitr :Gremove<cr>
" Gitlog in upper window
nnoremap <leader>gitl :Shell git gl -18<cr>:wincmd \|<cr>

"Each time you open a git object using fugitive it creates a new buffer.
"This means that your buffer listing can quickly become swamped with
"fugitive buffers.
"Here’s an autocommand that prevents this from becomming an issue:
"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Gundo{{{
""""""""""""""""""""""""""""""
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" Latex related {{{
""""""""""""""""""""""""""""""""""""""
"Shortcut to Begin{itemize}
map <leader>bi o\begin{itemize}<Esc>
"shortcut to End {itemize}
map <leader>ei o\end{itemize}<Esc>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" NERD Tree Explorer{{{
""""""""""""""""""""""""""""""
" Lets ignore some file from showing in the NERDTree
let NERDTreeIgnore=['\.vim$', '\~$', '.pyc$']

"The_NERD_tree
augroup ps_nerdtree
    au!
    au Filetype nerdtree setlocal nolist
    "au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', '.*.pid', '.*\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'
""""""""""""""""""""""""""""""}}}

" Yankring {{{
""""""""""""""""""""""""""""""
" Hit p to past and then Control+p and Control+N to cycle through registers
"
let g:yankring_zap_keys = 'f F / ?'
"
""""""""""""""""""""""""""""""}}}

" Taglist{{{
""""""""""""""""""""""""""""""
let Tlist_Show_Menu=0
nnoremap <C-]> g<C-]>

let Tlist_Use_Right_Window = 1

set tags+=tags;/
set showfulltag  "Show more information while completing tags

"If it is a latex file
let s:tlist_def_tex_settings = 'tex;s:section;c:chapter;l:label;r:ref'
""""""""""""""""""""""""""""""}}}

" Commentary {{{
""""""""""""""""""""""""""""""
" Comment out lines with \\\ or \\{motion} (which is better)
" Simple but works nicely
""""""""""""""""""""""""""""""}}}

" Syntastic {{{
""""""""""""""""""""""""""""""
" Checks syntax errors when you save the file
" In cpp you can include all .h header in syntastic_lib dir to help it
let g:syntastic_check_on_open= 0

" When set to 2 the error window will be automatically closed when no errors are detected, but not opened automatically
let g:syntastic_auto_loc_list= 2
" In order to also check header files add this to your .vimrc:
" " (this usually creates a .gch file in your source directory)
let g:syntastic_c_check_header = 1

" If enabled, syntastic will error message associated with the current line to the command window.
let g:syntastic_echo_current_error = 0

"" In order to add some custom include directories that should be added to the
" gcc command line you can add those to the global variable
" " g:syntastic_c_include_dirs. This list can be used like this:
" syntastic_lib is just a sym link if the directory is somewhere weird
let g:syntastic_cpp_include_dirs = [ 'syntastic_lib', 'includes', 'headers', 'include' ]
""""""""""""""""""""""""""""""}}}

" Surround {{{
""""""""""""""""""""""""""""""
" from: http://www.catonmat.net/blog/vim-plugins-surround-vim/
"
" Examples of deleting surroundings (ds):
" Text              Command    New Text
" ---------------   -------    -----------
" 'Hello World'    ds'        Hello World
" (123+4*56)/2     ds(        123+4*56/2
" <div>foo</div>   dst        foo

" Examples of changing surroundings (cs):
" Text              Command    New Text
" ---------------   -------    -----------
" "Hello world!"   cs"'       'Hello world!'
" "Hello world!"   cs"<q>     <q>Hello world!</q>
" foo!             csW'       'foo!'

" Examples of inserting surroundings (ys):
" Text              Command      New Text
" ---------------   -------      -----------
" Hello world!     ysiw)        Hello (world)!
" foo              ysiwt<html>  <html>foo</html>
" foo quux baz     yss"         "foo quux baz"
"
" Visual mode
" -----------
"  s - in visual mode, add a surrounding
"  S - in visual mode, add a surrounding but place text on new line + indent it
"
"   * Visually Select:
"
"      <em>Hello</em> world!
"
"  * type: S<p class="important">.
"
"      <p class="important">
"        <em>Hello</em> world!
"      </p>
""""""""""""""""""""""""""""""}}}

" UltiSnips {{{
""""""""""""""""""""""""""""""
"Use :call UltiSnips_ListSnippets() to list available snippets
"Should be control+tab but isn't working
""""""""""""""""""""""""""""""}}}
"######################################### End of Plug-in related 1}}}
"
"
" Colors and Fonts{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"By far my favourite in the old days
"color desert

"Trying something new
colorscheme xoria256m

" Other good options
"color xoria256
"color molokai
"color hemisu
"color badwolf
"color nazca
"color jellyx

"Font type and size
"set guifont=Terminus\ 8
set guifont=Monospace\ 8

"set Pattern matching highlight
hi MatchParen guifg=#000000 guibg=#D0D090

if has("gui_running")
    set guioptions=a
    set guioptions-=m " turn off menu bar
    set guioptions-=T " turn off toolbar
    set guicursor=a:blinkon0
endif

"Highlight current line
set cursorline
if has("gui_running")
    set cursorline
    hi cursorline guibg=black
endif

"Highlight spaces at the end of lines TODO - Not working
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"""""""""""""""""""""""""""""""""""""""""""}}}


" Experimental {{{1
"#########################################
" Seen in http://www.programmerq.net/rsttricks.html"
" Type @h and the character u want to use for the heading: '=', '-', etc...
let @h = "yypVr"

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Whenever i forget to use sudo vim... Now just write with 'w!!'
cmap w!! w !sudo tee >/dev/null %

" ControlP related
let g:ctrlp_map = '<leader>o'
nnoremap <leader>p :CtrlPTag<cr>
let g:ctrlp_extensions = ['tag']

let g:ctrlp_by_filename = 1 " Set to 1 to search by filename (as opposed to full path) Change with Control-D
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|doc)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|zip)$',
  \ 'link': 'syntastic_lib'}
let g:ctrlp_working_path_mode = '0'     "Disable because i like to search from current directory

hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
hi BufferNormal term=NONE ctermfg=grey ctermbg=black cterm=NONE


"######################################### End of Experimental 1}}}
"-----------------------------------------------------------------------
" vim: set shiftwidth=4 softtabstop=4 expandtab tw=72                  :
