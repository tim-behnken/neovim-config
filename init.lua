-- Set leader first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("custom.opts")
require("custom.keymaps")
require("custom.autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

vim.lsp.config["luals"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}
vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("pyright")
vim.lsp.enable("bash-language-server")
-- vim: ts=2 sts=2 sw=2 et
