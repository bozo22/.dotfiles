require("mason").setup({
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local servers = {
  "sumneko_lua",
  "pyright",
  "clangd",
  "bashls",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local null_ls_sources = {
  "stylua",
  "black",
}

require("mason-null-ls").setup({
  ensure_installed = null_ls_sources,
})

