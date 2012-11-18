" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"

hi StatusLine term=bold cterm=bold ctermbg=grey ctermfg=black gui=bold
hi StatusLineNC term=NONE cterm=NONE ctermbg=grey ctermfg=black gui=NONE
hi VertSplit term=NONE cterm=NONE ctermbg=grey ctermfg=grey gui=NONE

" vim: sw=2
