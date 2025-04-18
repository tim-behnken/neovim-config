-- Keymaps
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Open oil
vim.keymap.set("n", "-", "lua Oil.open({}, {preview={'vertical'}})", { desc = "Open parent directory" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_user_command("ToggleLineNumbers", function()
  if vim.opt.number:get() then
    vim.opt.relativenumber = false
    vim.opt.number = false
  else
    vim.opt.number = true
  end
end, {})

vim.api.nvim_create_user_command("ToggleRelativeLineNumbers", function()
  if vim.opt.relativenumber:get() then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end, {})

-- LSP configs

-- Toggle git blame
vim.keymap.set("n", "<space>gb", "<cmd>GitBlameToggle<CR>")

-- Toggle line numbers
vim.keymap.set("n", "<space>n", "<cmd>ToggleLineNumbers<CR>")

-- Toggle relative line numbers
vim.keymap.set("n", "<space>r", "<cmd>ToggleRelativeLineNumbers<CR>")

-- Comment/uncomment
vim.keymap.set("n", "<space>/", "gc", { desc = "Comment selected code" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Live reload Lua code/config
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source the current file" })
vim.keymap.set("n", "<space>lx", ":.lua<CR>", { desc = "Execute selected lua code" })

-- Quickfix movement
vim.keymap.set("n", "N", "<cmd>cnext<CR>")
vim.keymap.set("n", "P", "<cmd>cprev<CR>")
vim.keymap.set("n", "<C-S-q>", "<cmd>cclose<CR>")

-- ToggleTerm
vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm<CR>")

-- Open oil
vim.keymap.set("n", "-", "<cmd>Oil --preview --float<CR>")

-- Open github repos
vim.keymap.set("n", "or", "<cmd>Oil --preview --float ~/code/github.com<CR>")

-- -- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
