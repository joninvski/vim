" Author:  Eric Van Dewoestine
" Version: $Revision: 1034 $
"
" Description: {{{
"   Plugin for archive related functionality.
"
" License:
"
" Copyright (c) 2005 - 2006
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"      http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
"
" }}}

augroup eclim_archive
  autocmd!
  autocmd BufReadCmd
    \ jar:/*,jar:\*,jar:file:/*,jar:file:\*,zip:/*,zip:\*,zip:file:/*,zip:file:\*
    \ call <SID>ReadArchiveFile()
augroup END

" Script Variables {{{
let s:command_read = '-command read_file -f "<file>"'
let s:command_read_class =
  \ '-command java_class_prototype -p "<project>" -c <class>'
" }}}

" ReadArchiveFile() {{{
function! s:ReadArchiveFile ()
  let file = substitute(expand('%'), '\', '/', 'g')
  if file =~ '.class$'
    let class = substitute(file, '.*!\(.*\)\.class', '\1', '')
    let class = substitute(class, '/', '.', 'g')

    let project = exists('g:EclimLastProject') ?
      \ g:EclimLastProject : eclim#project#GetCurrentProjectName()

    if project == ''
      call eclim#util#EchoError(
        \ 'Could not open archive file: Unable to determine project.')
      return
    endif

    let command = s:command_read_class
    let command = substitute(command, '<project>', project, '')
    let command = substitute(command, '<class>', class, '')
  else
    let command = substitute(s:command_read, '<file>', file, '')
  endif

  let file = eclim#ExecuteEclim(command)

  if string(file) != '0'
    let bufnum = bufnr('%')
    silent exec "keepjumps edit! " . file

    exec 'bdelete ' . bufnum

    " alternate solution, that keeps the archive url as the buffer's filename,
    " but prevents taglist from being able to parse tags.
    "setlocal noreadonly
    "setlocal modifiable
    "silent! exec "read " . file
    "let saved = @"
    "1,1delete
    "let @" = saved

    silent exec "doautocmd BufReadPre " . file
    silent exec "doautocmd BufReadPost " . file

    setlocal readonly
    setlocal nomodifiable
    setlocal noswapfile
    " causes taglist.vim errors (fold then delete fails)
    "setlocal bufhidden=delete
  endif
endfunction " }}}

" vim:ft=vim:fdm=marker
