require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- make my migration smoother
-- guidance: https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
vim.keymap.set('n', ',z', ':bp<CR>')
vim.keymap.set('n', ',x', ':bn<CR>')
vim.keymap.set('n', ',h', ':<C-u>split<CR>')
vim.keymap.set('n', ',v', ':<C-u>vsplit<CR>')
vim.keymap.set('n', ',c', ':bd<CR>')

vim.keymap.set('n', ',ga', ':Gwrite<CR>')
vim.keymap.set('n', ',gb', ':Git blame<CR>')
vim.keymap.set('n', ',gd', ':Gvdiffsplit<CR>')

vim.opt.relativenumber = true
vim.opt.clipboard = ""
