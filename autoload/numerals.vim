" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

" Private Functions: {{{1
let s:numeral_dict = {
      \'I': 1,
      \'IV': 4,
      \'V': 5,
      \'IX': 9,
      \'X': 10,
      \'XL': 40,
      \'L': 50,
      \'XC': 90,
      \'C': 100,
      \'CD': 400,
      \'D': 500,
      \'CM': 900,
      \'M': 1000,
      \}

function! s:sort_numerals(a, b) abort
  return a:a[1] > a:b[1] ? 1 : a:a[1] < a:b[1] ? -1 : 0  
endfunction

let s:numeral_list = sort(items(s:numeral_dict), 's:sort_numerals')

" Library Interface: {{{1
function! numerals#roman2arabic(roman) abort
  let l:arabic = 0
  let l:previous = 0
  for l:numeral in reverse(split(a:roman, '\zs'))
    let l:digit = get(s:numeral_dict, toupper(l:numeral))
    if l:previous > l:digit
      let l:previous -= l:digit
      let l:arabic -= l:digit
    else
      let l:arabic += l:digit
      let l:previous = l:digit
    endif
  endfor
  return l:arabic
endfunction

function! numerals#arabic2roman(arabic) abort
  let l:roman = '' 
  let l:remaining = a:arabic
  while l:remaining > 0
    for [l:numeral, l:digit] in reverse(copy(s:numeral_list))
      if l:digit <= l:remaining
        let l:roman .= l:numeral
        let l:remaining -= l:digit
        break
      endif
    endfor
  endwhile
  return l:roman
endfunction

function! numerals#calculate(calc) abort
  let l:roman_calc = substitute(a:calc, '\([IVXLCDM]\+\)',
        \ '\=numerals#roman2arabic(submatch(1))', 'g')
  return eval(l:roman_calc)
endfunction

function! numerals#calculate_roman(calc) abort
  let l:arabic_result = numerals#calculate(a:calc)
  return numerals#arabic2roman(l:arabic_result)
endfunction

" Teardown:{{{1
let &cpo = s:save_cpo

" Misc: {{{1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
