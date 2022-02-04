vim.cmd [[
try
  " colorscheme gruvbox-flat

  let g:tokyodark_transparent_background = 1
  colorscheme tokyodark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
