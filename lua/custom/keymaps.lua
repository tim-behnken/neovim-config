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

-- Copilot chat
vim.keymap.set("n", "cco", "<cmd>CopilotChatOpen<CR>", { desc = "Open Copilot chat" })
vim.keymap.set("n", "ccc", "<cmd>CopilotChatClose<CR>", { desc = "Close Copilot chat" })
-- Open github repos
-- vim.keymap.set("n", "or", "<cmd>Oil --preview --float ~/code/github.com<CR>")
--
-- hop
vim.keymap.set("n", "<leader>w", "<cmd>HopWord<CR>", { desc = "Hop to word" })
vim.keymap.set("n", "<leader>l", "<cmd>HopLine<CR>", { desc = "Hop to line" })
vim.keymap.set("n", "<leader>c", "<cmd>HopChar2<CR>", { desc = "Hop to char" })

-- lsp
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show hover" })
vim.keymap.set("n", "gh", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })

-- -- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
