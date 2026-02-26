-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- -- close the quickfix once selected
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "qf", -- quickfix filetype
--   callback = function()
--     vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true })
--   end,
-- })

-- enable standard autocompletions
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
  end,
})
