return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      python = { "ruff_format" },
      lua = { "stylua" },
      sh = { "shfmt" },
    },
  },
}
