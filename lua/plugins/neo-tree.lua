return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "<leader>E", "<cmd>Neotree toggle<CR>", desc = "Neo-tree float" },
  },
  opts = {
    window = {
      position = "float",
    },
    filesystem = {
      hijack_netrw_behavior = "disabled", -- we manage netrw ourselves
      follow_current_file = {
        enabled = true, -- highlights current file when you open it
      },
    },
  },
}
