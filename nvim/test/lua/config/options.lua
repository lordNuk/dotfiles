local opt = vim.opt

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- looks
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "100"
opt.cmdheight = 1
opt.scrolloff = 14
opt.completeopt = "menuone,noinsert,noselect"

-- behaviour
opt.errorbells = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.encoding = "UTF-8"
