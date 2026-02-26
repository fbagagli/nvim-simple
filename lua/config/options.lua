local opt = vim.opt

-- LINE NUMBERS
opt.number = true
opt.relativenumber = true
-- opt.numberwidth = 2

-- INDENTATION
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true -- Round indent to multiple of shiftwidth

-- SEARCH BEHAVIOR
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false -- Disable persistent search highlight (use incsearch instead)
opt.incsearch = true
opt.inccommand = "nosplit" -- Live preview of substitutions

-- VISUAL FEEDBACK
opt.cursorline = true
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.colorcolumn = "80"
opt.wrap = false

-- CURSOR
opt.guicursor = "i:block" -- Block cursor in insert mode

-- EDITING BEHAVIOR
opt.mouse = "a"
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.scrolloff = 8
opt.updatetime = 250
opt.timeoutlen = 500
opt.confirm = true
opt.completeopt = { "menuone", "popup", "noinsert" }

-- SPLIT BEHAVIOR
opt.splitright = true
opt.splitbelow = true

-- WHITESPACE DISPLAY
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "»",
  precedes = "«",
}

-- NETRW disabled
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- DIAGNOSTIC DISPLAY
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
