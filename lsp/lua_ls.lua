-- ~/.config/nvim/lua/user/lsp/lua_ls.lua
return {
  cmd = { "lua_ls" },
  filetypes = { "lua" },
  root_dir = require("lspconfig.util").root_pattern(
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git"
  ),
  -- This is the Neovim 0.11+ equivalent of nvim-lspconfig's on_init
  on_new_config = function(new_config, new_dir)
    -- Only patch settings if the config isn't already customized
    if new_config.settings and new_config.settings.Lua and new_config.settings.Lua.workspace then
      return
    end

    -- Ensure we're in a Neovim config directory or any workspace folder
    local is_neovim_dir = vim.fn.stdpath("config") == new_dir
    local in_workspace = vim.tbl_contains(new_config.workspaceFolders or {}, {
      name = vim.fn.stdpath("config"),
      index = 0,
    })

    if is_neovim_dir or in_workspace then
      -- Deep-extend settings to add Neovim's ~.config/nvim to script.path
      new_config.settings = vim.deep_extend("force", new_config.settings or {}, {
        Lua = {
          workspace = {
            checkThirdParty = false,
            -- Add Neovim's runtime to paths (so vim.* modules are resolved)
            preloadFile = {
              vim.fn.stdpath("config") .. "/lua/__init__.lua", -- optional: extra stub
            },
            -- This is the key: script.path = { "$NEOVIM_CONFIG/lua", "$NEOVIM_CONFIG/lua/?/init.lua" }
            -- LuaLS will infer paths automatically, but this guarantees vim.* is found
            path = {
              "$NEOVIM_CONFIG/lua",
              "$NEOVIM_CONFIG/lua/?/init.lua",
              "$NEOVIM_CONFIG/lua/?/.lua",
            },
          },
        },
      })
    end
  end,
  -- Optional: fallback static settings (if no workspace detected)
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}
