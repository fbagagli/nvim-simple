return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "basedpyright",
        "clangd",
        "bashls",
      },
      automatic_enable = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "clang-format",
        "ruff",
        "shfmt",
        "stylua",
      },
    })
  end,
}
