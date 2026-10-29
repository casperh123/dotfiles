require "nvchad.autocmds"

-- 2-space languages; everything else gets 4 from options.lua (a project's .editorconfig overrides both)
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
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
    "lua",
    "markdown",
  },
  callback = function(args)
    vim.bo[args.buf].shiftwidth = 2
    vim.bo[args.buf].softtabstop = -1 -- markdown's ftplugin forces 4
  end,
})

-- treesitter indent where nvim-treesitter has indent rules, vim's built-in indent/<ft>.vim elsewhere
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    local ok, query = pcall(vim.treesitter.query.get, lang, "indents")
    if ok and query then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- C# has no treesitter indent rules; j1 stops cindent pushing lambda braces past the call
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function(args)
    vim.bo[args.buf].cinoptions = vim.bo[args.buf].cinoptions .. ",j1"
  end,
})
