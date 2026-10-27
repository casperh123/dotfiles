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

-- read :h vim.lsp.config for changing options of lsp servers
