-- -==*==- Options -==*==- --

-- General
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.shell = '/usr/bin/bash'

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- UX
vim.opt.signcolumn = 'auto:3'
vim.opt.spell = false
vim.opt.mouse = 'a'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.timeout = true
vim.opt.timeoutlen = 1500
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- styling
vim.opt.hlsearch = false
vim.opt.hidden = false
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.wildmode = 'full'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fileencoding = 'utf-8'
