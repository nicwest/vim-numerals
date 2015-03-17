let s:suite = themis#suite('plugin')
let s:assert = themis#helper('assert')


function! s:suite.numerals_echos_correct_value_in_roman_numerals()
  let l:output = ''
  redir => l:output
  :Numerals VIII + III
  redir END
  call s:assert.equals(l:output[1:], 'XI')
endfunction

function! s:suite.numerals_bang_echos_correct_value_in_arabic_numerals()
  let l:output = ''
  redir => l:output
  :Numerals! VIII + III
  redir END
  call s:assert.equals(l:output[1:], 11)
endfunction

function! s:suite.numerals_complex_calculation()
  let l:output = ''
  redir => l:output
  :Numerals (VIII + IV) / III
  redir END
  call s:assert.equals(l:output[1:], 'IV')
endfunction

