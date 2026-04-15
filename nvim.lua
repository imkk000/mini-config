-- common option
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.visualbell = true
vim.opt.wrap = false

-- default keymaps
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "x", '"_x', { silent = true, noremap = true })
-- stylua: ignore
vim.keymap.set({ "i", "x", "n", "s" }, "<c-s>", function() vim.cmd("w") end, { silent = true, noremap = true })
vim.keymap.set("n", "<c-w>\\", "<c-w>v", { silent = true, noremap = true })
vim.keymap.set("n", "<c-w>-", "<c-w>s", { silent = true, noremap = true })
