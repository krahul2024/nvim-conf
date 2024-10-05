vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.neovide_font = "JetBrains Mono Nerd Font"
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('n', '<leader>c', '"+yy', { noremap = true, silent = true })
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>sw', '0^')
vim.keymap.set('n', '<leader>ew', '$a')






