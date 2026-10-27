-- nvim-treesitter (main branch) only uses this list for :TSInstallAll;
-- highlighting is started by NvChad and indent is set in autocmds.lua
local options = {
  ensure_installed = {
    -- NvChad defaults
    "lua",
    "luadoc",
    "printf",
    "vim",
    "vimdoc",

    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "svelte",
    "php",
    "c_sharp",
    "go",
    "python",
    "rust",
    "json",
    "markdown",
  },
}

return options
