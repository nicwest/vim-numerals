" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
if exists("g:loaded_numerals") || &cp
  let &cpo = s:save_cpo
  finish
endif
let g:loaded_numerals = 1

" Private functions: {{{1
function! s:Numerals(calc, roman) abort
  echo "ROMAN THINGS"
  return a:roman ? numerals#calculate(a:calc) : numerals#calculate_roman(a:calc)
endfunction

" Commands: {{{1
command! -nargs=+ -bang Numerals echo <SID>Numerals('<args>', '<bang>' == '!')

" Teardown: {{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
