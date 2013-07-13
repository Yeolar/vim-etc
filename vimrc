" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Add to runtimepath with /usr/share/vim/vimfiles, for Archlinux
"set rtp+=/usr/share/vim/vimfiles


" ** Terminal view and some other options **
" ==========================================
"
let &t_Co=256
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  color default     " some good scheme:
                    "   default evening
                    "   morning shine blue
                    "   peachpuff delek desert
  set hlsearch      " open the search highlight
  set nohlsearch    " close the search highlight
endif

" allow backspacing over everything in insert mode
set backspace=2

set autowrite       " automatically save before commands like :next, :make
set nobackup        " no file backup
set showcmd         " display incomplete commands
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
"set number          " show the line number
"set splitright      " open the new window on the right instead of the left
"set splitbelow      " open the new window on the below instead of the top
set showmatch       " show matching brackets.
set incsearch       " do incremental searching
set ignorecase      " do case insensitive matching
set smartcase       " do smart case matching
set hidden          " hide buffers when they are abandoned
set autochdir       " auto change work directory to current file directory

" Tab default for 4, and change tabs to spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Display TABs
set list
set listchars=tab:>-,trail:-

" Fold method
set foldmethod=indent
set foldlevelstart=99

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set status line format and show items
set laststatus=2    " show status
set statusline=%4*\ %<%f\ %*%6*%M%*%2*\ %R%H%W%*%2*%=%*%2*\ %{&ff}\ %{&fenc}\ 0x%02B\ %*%1*\ %3p%%\ %L\ %*%5*\ %3l:%-3v\ %*
hi User1 term=bold cterm=bold ctermfg=white ctermbg=grey
hi User2 term=bold cterm=bold ctermfg=white ctermbg=darkgrey
hi User3 term=bold cterm=bold ctermfg=white ctermbg=darkblue
hi User4 term=bold cterm=bold ctermfg=white ctermbg=darkmagenta
hi User5 term=bold cterm=bold ctermfg=black ctermbg=white
hi User6 term=bold cterm=bold ctermfg=red ctermbg=white

" Highlight the characters which over the 80 column in long lines
"match ErrorMsg /\%>80v.\+/
" alternative
"highlight overlength ctermbg=red ctermfg=white guibg=#592929
"match overlength /\%>80v.*/
"highlight overlength ctermbg=gray
"match overlength /\%81v/

" Compatible for rxvt in MSYS
map  <Esc>[7~ <Home>
map  <Esc>[8~ <End>
imap <Esc>[7~ <Home>
imap <Esc>[8~ <End>

" <F10> open paste, <F11> close paste
"map <F10> :set paste<CR>
"map <F11> :set nopaste<CR>
"imap <F10> <C-O>:set paste<CR>
"imap <F11> <nop>
"set pastetoggle=<F11>


" ** GUI View **
" ==============
"
if has("gui_running")
" set columns=84
" set lines=48

  " Toggle menu and toolbar
" set guioptions-=m     " hide menu
  set guioptions-=T     " hide toolbar
  set guioptions-=r     " hide right scroll

  " <F2> to show or hide menu
  map <silent> <F2> :
  \ if &guioptions =~# 'm' <Bar>
  \   set guioptions-=m <Bar>
  \ else <Bar>
  \   set guioptions+=m <Bar>
  \ endif<CR>

  " Font style in Windows
  if has("win32")
  " set guifont=Consolas:h9
  " set guifontwide=新宋体:h10
    set guifont=Consolas:h10
    set guifontwide=新宋体:h10.5
  endif
endif


" ** Fileformat and fileencoding **
" =================================
"
" Set file format to unix
set fileformats=unix,dos
set fileformat=unix

" Set file encoding to utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
let &termencoding = &encoding
"language message en_US      " for default and MSYS
if has("win32") && has("gui_running")
  language message zh_CN.UTF-8
  source $VIMRUNTIME/delmenu.vim
  set langmenu=zh_CN.UTF-8
  source $VIMRUNTIME/menu.vim
endif

" Convert the encoding of error output
if has("win32") && has("gui_running")
  function QfMakeConv()
    let qflist = getqflist()
    for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
    endfor
    call setqflist(qflist)
  endfunction
  au QuickfixCmdPost make call QfMakeConv()
endif


" ** Formatting **
" ================
"
" Set comments format for C/C++
set comments=://
set comments=s1:/*,mb:*,ex:*/

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
map QA gqap


" ** Key maps **
" ==============
"
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap () ()<Left>
inoremap ()<Enter> (<Enter>)<Up><End><Enter>
inoremap {} {}<Left>
inoremap {}<Enter> {<Enter>}<Up><End><Enter>
inoremap [] []<Left>
inoremap []<Enter> [<Enter>]<Up><End><Enter>
inoremap <> <><Left>
inoremap `` ``<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>

" autocomplete display better
"inoremap <buffer> <c-x><c-u> <c-x><c-u><c-p>
"inoremap <buffer> <c-s-space> <c-x><c-u><c-p>

" switch window
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" resize window
nnoremap <C-S-Left> 5<c-w><
nnoremap <C-S-Down> 5<c-w>-
nnoremap <C-S-Up> 5<c-w>+
nnoremap <C-S-Right> 5<c-w>>

" move tabs
nnoremap <silent> <M-C-left> :if tabpagenr() == 1\|exe "tabm ".tabpagenr("$")\|el\|exe "tabm ".(tabpagenr()-2)\|en<CR>
nnoremap <silent> <M-C-right> :if tabpagenr() == tabpagenr("$")\|tabm 0\|el\|exe "tabm ".tabpagenr()\|en<CR>

" switch tabs
nnoremap <silent> <M-left> gT
nnoremap <silent> <M-right> gt

" switch buffers
nnoremap <silent> <C-left> :bnext<cr>
nnoremap <silent> <C-right> :bNext<cr>

" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
"
"set notimeout 
"
" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"
"set timeoutlen=4000
"
" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
"
"set ttimeout 
"
" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
"set ttimeoutlen=100


" ** Autocmd **
" =============
"
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting
  filetype on
  filetype plugin on
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

  " Set filetype for Python Server Pages (psp).
  autocmd BufNewFile,BufRead *.psp setfiletype psp

  " For all text files set 'textwidth' to 76 characters.
  autocmd FileType text setlocal textwidth=76

  " Set rst file format options
" autocmd FileType rst setlocal textwidth=74
" autocmd FileType rst set formatoptions+=nmB

  " Open Complete for some src files.
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType java set omnifunc=javacomplete#Complete
" autocmd FileType java set omnifunc=javacomplete#CompleteParamsInfo
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType css set omnifunc=csscomplete#Complete
" autocmd FileType html set omnifunc=htmlcomplete#Complete
" autocmd FileType xml set omnifunc=xmlcomplete#Complete

  " Set make
  autocmd FileType c compiler gcc
  autocmd FileType c setlocal makeprg=gcc\ $*

  autocmd FileType python compiler pyunit
  autocmd FileType python setlocal makeprg=python\ $*
  autocmd FileType python setlocal efm=\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m

  augroup END
else
  set autoindent        " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and
" the file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif


" ** Plugins **
" =============
"
" Set TOhtml plugin
let g:html_number_lines=1
let g:html_use_css=1
let g:use_xhtml=1

" Set Man plugin
source $VIMRUNTIME/ftplugin/man.vim

" Set Tagbar plugin
nmap <silent> <F7> :TagbarToggle<CR>

" Set NERDTree
nmap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\.swp']

" Set DoxyGenToolkit plugin
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="Yeolar <yeolar@gmail.com>"

" Comment
"
fun! <SID>CommentFunc(arg)
  if (a:arg == "")
    let s:cc = "Created on ".strftime("%Y-%m-%d").".  Copyright (C) Yeolar <yeolar@gmail.com>"
    if (&ft == "c" || &ft == "cpp")
      exec "normal O"."/*\<enter>".s:cc."\<enter>/\<enter>"
    elseif (&ft == "sh" || &ft == "python")
      exec "normal O"."#!/usr/bin/env python\<enter># -*- coding: utf-8 -*-\<enter>#\<enter># ".s:cc."\<enter>#\<enter>"
    else
      exec "normal O".s:cc
    endif
  elseif (a:arg == "a")
    if (&ft == "c" || &ft == "cpp")
      exec "normal A"."/* Added by Yeolar */"
    elseif (&ft == "sh" || &ft == "python")
      exec "normal A"."# Added by Yeolar"
    else
      exec "normal A"."Added by Yeolar"
    endif
  elseif (a:arg == "d")
    exec "normal a".strftime("%Y-%m-%d")
  endif
endfun

command! -nargs=? C :call <SID>CommentFunc("<args>")

" C head file def
"
fun! <SID>CHeadFileDefFunc()
  let s:hf = "__".toupper(expand("%:t:r"))."_H"
  exec "normal O"."#ifndef ".s:hf."\<enter>#define ".s:hf."\<enter>\<enter>\<enter>\<enter>#endif /* ".s:hf." */\<up>\<up>"
endfun

command! -nargs=0 CHdef :call <SID>CHeadFileDefFunc()

