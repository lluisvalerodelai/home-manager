-- lua/settings.lua
local set = vim.opt

-- UI settings
set.number = true
vim.opt.relativenumber = true
set.termguicolors = true

-- Tabs and indentation
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

local map = vim.keymap
    .set                                       --instead of writing vim.keymap.set every time just define map to be vim.keymap.set
local opts = { noremap = true, silent = true } --opts is a table with option we will pass into the map() calls, to save repetion. noremap prevents recursive definitions, silent prevents it from throwing an error every time

vim.g.mapleader = " "

local telescope_builtin = require("telescope.builtin")
local oil = require("oil")


--telescope
map("n", "<leader>ff", telescope_builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Telescope help tags" })

--editors
map("n", "<leader>o", oil.open, opts)

--splits
map("n", "<leader>sh", ":split<CR>", opts)
map("n", "<leader>sv", ":vsplit<CR>", opts)

--navigating splits: just do ctrl+w [hjkl]

map("n", "<leader>+", ":resize +5<CR>", opts)          -- Increase height
map("n", "<leader>-", ":resize -5<CR>", opts)          -- Decrease height
map("n", "<leader>>", ":vertical resize +5<CR>", opts) -- Increase width
map("n", "<leader><", ":vertical resize -5<CR>", opts) -- Decrease width

local cmd = vim.api
    .nvim_create_autocmd --define cmd to be vim.api.nvim_create_autocmd to avoid having to write that everytime

-- Highlight yanked text
cmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})
