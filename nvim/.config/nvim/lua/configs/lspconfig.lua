require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("emmet_language_server", {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "razor",
    "svelte",
    "php",
  },
})

local servers = {
  "gopls",
  "html",
  "cssls",
  "ts_ls",
  "pylsp",
  "rust_analyzer",
  "phpantom_lsp",
  "emmet_language_server",
  "svelte",
}
vim.lsp.enable(servers)

-- let servers that support it (e.g. roslyn on "\n", "}" and ";") fix indent as you type
vim.lsp.on_type_formatting.enable()

-- read :h vim.lsp.config for changing options of lsp servers
