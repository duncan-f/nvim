-- KEYBINDS
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local keymap = vim.keymap

local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, noremap = true, silent = true }

keymap.set("n", "J", "mzJ`z") -- Remap joining lines
keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv") -- center screen when looping search results
keymap.set("n", "N", "Nzzzv")

-- Directory Navigation
keymap.set("n", "<leader>n", vim.cmd.Lex, opts)
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)

-- Buffer Navigation
keymap.set("n", "<leader>bp", "<cmd>bp<CR>", opts)
keymap.set("n", "<leader>bn", "<cmd>bn<CR>", opts)
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", opts)

-- Window Management
keymap.set("n", "<leader>sv", vim.cmd.vsplit, opts)
keymap.set("n", "<leader>sh", vim.cmd.split, opts)
keymap.set("n", "<leader>sm", vim.cmd.MaximizerToggle, opts)

-- Tabs
keymap.set("n", "<leader>nt", vim.cmd.tabnew, opts)
keymap.set("n", "<leader>ct", vim.cmd.tabclose, opts)
keymap.set("n", "<leader>pt", vim.cmd.tabprevious, opts)
keymap.set("n", "<leader>nn", vim.cmd.tabnext, opts)

-- map keys for Copy/Pasting
keymap.set("x", "<leader>p", '"_dP', opts)
keymap.set("n", "<leader>y", '"+y', opts)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>Y", 'gg"+yG', opts)
keymap.set("v", "<leader>d", '"+d', opts)
keymap.set("n", "<leader>v", '"+p', opts)
keymap.set("n", "<leader>a", '<Esc>"_ggVG', opts)

-- Indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- compiler on writing to file
keymap.set("n", "<leader>c", ":w! <bar> !compiler <c-r>%<CR>")

-- run Python files
keymap.set("n", "<leader>t", ":!python %<CR>")

-- Make file exacutable
keymap.set("n", "<leader>x", ":!chmod +x <c-r>%<CR>")

-- Open corresponding .pdf/.html or preview
keymap.set("n", "<leader>pw", ":!opout <c-r>%<CR><CR>")

-- source file
keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end)

-- Git (Fugitive)
keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Git (Fugitive)" })

keymap.set("n", "<leader>gp", function()
	vim.cmd.Git({ "push" })
end, opts)

-- rebase always
keymap.set("n", "<leader>gP", function()
	vim.cmd.Git({ "pull", "--rebase" })
end, opts)

-- NOTE: It allows me to easily set the branch i am pushing and any tracking
-- needed if i did not set the branch up correctly
keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)
