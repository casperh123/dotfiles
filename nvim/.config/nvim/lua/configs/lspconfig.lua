require("nvchad.configs.lspconfig").defaults()

local servers = {
    "gopls";
    "html",
    "cssls",
    "ts_ls",
    "pylsp",
    "rust_analyzer",
    "phpantom_lsp"
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
