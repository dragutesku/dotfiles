-- Set the leader to space
vim.g.mapleader = " "

-- Go back to file tree ( deprecated due to CHADtree )
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Chad Tree Open
vim.keymap.set("n", "<leader>v", vim.cmd.CHADopen)

-- Terminal Remaps
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)

