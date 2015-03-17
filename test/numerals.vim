let s:suite = themis#suite('numerals')
let s:assert = themis#helper('assert')

function! s:suite.roman2arabic_gets_correct_number()
  call s:assert.equals(numerals#roman2arabic('I'), 1)
  call s:assert.equals(numerals#roman2arabic('V'), 5)
  call s:assert.equals(numerals#roman2arabic('II'), 2)
  call s:assert.equals(numerals#roman2arabic('III'), 3)
  call s:assert.equals(numerals#roman2arabic('IV'), 4)
  call s:assert.equals(numerals#roman2arabic('DIV'), 504)
  call s:assert.equals(numerals#roman2arabic('CC'), 200)
  call s:assert.equals(numerals#roman2arabic('MCMLIV'), 1954)
  call s:assert.equals(numerals#roman2arabic('MLXVI'), 1066)
endfunction

function! s:suite.arabic2roman_gets_correct_numeral()
  call s:assert.equals(numerals#arabic2roman(1), 'I')
  call s:assert.equals(numerals#arabic2roman(5), 'V')
  call s:assert.equals(numerals#arabic2roman(2), 'II')
  call s:assert.equals(numerals#arabic2roman(3), 'III')
  call s:assert.equals(numerals#arabic2roman(4), 'IV')
  call s:assert.equals(numerals#arabic2roman(504), 'DIV')
  call s:assert.equals(numerals#arabic2roman(200), 'CC')
  call s:assert.equals(numerals#arabic2roman(1954), 'MCMLIV')
  call s:assert.equals(numerals#arabic2roman(1066), 'MLXVI')
endfunction

function! s:suite.calculate_adds()
  call s:assert.equals(numerals#calculate('VIII + III'), 11)
endfunction

function! s:suite.calculate_subtracts()
  call s:assert.equals(numerals#calculate('VIII - III'), 5)
endfunction

function! s:suite.calculate_divides()
  call s:assert.equals(numerals#calculate('VIII / IV'), 2)
endfunction

function! s:suite.calculate_multiplies()
  call s:assert.equals(numerals#calculate('VIII * IV'), 32)
endfunction

function! s:suite.calculate_roman_adds()
  call s:assert.equals(numerals#calculate_roman('VIII + III'), 'XI')
endfunction

function! s:suite.calculate_roman_subtracts()
  call s:assert.equals(numerals#calculate_roman('VIII - III'), 'V')
endfunction

function! s:suite.calculate_roman_divides()
  call s:assert.equals(numerals#calculate_roman('VIII / IV'), 'II')
endfunction

function! s:suite.calculate_roman_multiplies()
  call s:assert.equals(numerals#calculate_roman('VIII * IV'), 'XXXII')
endfunction
