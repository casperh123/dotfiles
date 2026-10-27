require "nvchad.autocmds"

-- per-filetype indent width (anything not listed uses the 4-space default in options.lua)
-- a project's .editorconfig still takes precedence over these
local indent = {
  [2] = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "html",
    "css",
    "scss",
    "json",
    "jsonc",
    "yaml",
    "lua",
    "markdown",
  },
  [4] = { "cs", "razor", "php", "python", "rust", "c", "cpp", "java", "sh" },
}

for width, filetypes in pairs(indent) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function(args)
      local bo = vim.bo[args.buf]
      bo.tabstop = width
      bo.shiftwidth = width
      bo.softtabstop = width
      bo.expandtab = true
    end,
  })
end

-- go and make use real tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "make" },
  callback = function(args)
    local bo = vim.bo[args.buf]
    bo.tabstop = 4
    bo.shiftwidth = 4
    bo.softtabstop = 0
    bo.expandtab = false
  end,
})

-- use treesitter indent when a parser exists for the buffer
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.treesitter.get_parser(args.buf, nil, { error = false }) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
