local status_ok, nvim_tree = pcall(require, "nvim-tree")
-- Don't read this file if `nvim-tree is installed
if not status_ok then
  configNetrw()
end

function configNetrw()
  local keymap = vim.api.nvim_set_keymap

  local opts = { noremap = true, silent = true }
  local term_opts = { silent = true }

  -- This will override netrw's <C-R>
  -- vim.cmd [[
  --   au FileType netrw unmap <buffer> <C-L>
  --   au FileType netrw unmap <buffer> <C-R>
  --
  --   au FileType netrw nmap <buffer> \r <Plug>NetrwRefresh
  -- ]]
  vim.cmd [[
    augroup netrw_mappings
      autocmd!
      autocmd filetype netrw silent!unmap <buffer> <C-L>
      autocmd filetype netrw silent!unmap <buffer> <C-R>

      autocmd filetype netrw silent!map \r <Plug>NetrwRefresh
    augroup END
  ]]

  -- Update CWD on VimEnter event (example: `nvim ~/.config` will run Neovim and update the CWD to ~/.config automatically.)
  vim.cmd [[ autocmd VimEnter * silent! cd %:p:h ]]

  vim.cmd [[ command! ExploreFind let @/=expand("%:t") | execute 'Explore' expand("%:h") | normal n ]]

  vim.cmd [[
    let g:NetrwIsOpen=0

    function! ToggleNetrw()
      if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
          if (getbufvar(i, "&filetype") == "netrw")
            silent exe "bwipeout " . i 
          endif
          let i-=1
        endwhile
        let g:NetrwIsOpen=0
      else
        let g:NetrwIsOpen=1
        silent Lexplore
      endif
    endfunction

    " Add your own mapping. For example:
    " noremap <silent> <C-E> :call ToggleNetrw()<CR>
  ]]

  -- vim.g.netrw_banner = 0
  vim.g.netrw_liststyle = 3
  -- vim.g.netrw_browse_split = 4
  -- vim.g.netrw_altv = 1
  -- vim.g.netrw_winsize = 15
end
