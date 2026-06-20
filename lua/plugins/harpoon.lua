local harpoon = require("harpoon")

harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

vim.keymap.set("n", "<leader>aa", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<M-1>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<M-2>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<M-3>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<M-4>", function()
	harpoon:list():select(4)
end)
-- vim.keymap.set("n", "<leader>fl", function()
--   toggle_telescope(harpoon:list())
-- end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-p>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():next()
end)
