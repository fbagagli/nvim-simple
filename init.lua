vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require("config.options")

-- [[ Basic Keymaps ]]
require("config.keymaps")

-- [[ Basic autocommands ]]
require("config.autocmds")

-- [[ Configure and install plugins ]]
require("config.lazy")
