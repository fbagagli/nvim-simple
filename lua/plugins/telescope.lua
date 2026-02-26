return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "List open buffers",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Search in workspace",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Search in buffer",
    },
    {
      "<leader>S",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "Workspace symbols",
    },
    {
      "<leader>s",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Document symbols",
    },
  },
}
