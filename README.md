Numerals
========

Simple roman numeral calculator

Commands
--------

```vim
Numerals VIII + 8    " returns XVI
Numerals! VIII + 8   " returns 16
```

Commands will take both roman and arabic numerals


Tests
-----

Tests are written for [vim-themis][themis]. I'm lazy so I just clone it to the
plugin directory.

```
$ cd /path/to/vim-numerals
$ git clone git@github.com:thinca/vim-themis.git
$ vim-themis/bin/themis --reporter dot
```

[themis]: https://github.com/thinca/vim-themis


