local status_ok, tmux_navigation = pcall(require, "nvim-tmux-navigation")
if not status_ok then
  return
end

tmux_navigation.setup{}

vim.api.nvim_set_keymap('n', "<M-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<M-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
