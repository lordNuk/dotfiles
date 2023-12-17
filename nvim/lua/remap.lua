vim.g.mapleader = " "
-- keymapping
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader><CR>", ":source ~/.config/nvim/init.lua<CR>")
map("n", "<leader>pv", ":Ex<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map('n', '<Space>', '<Nop>', { silent = true })
map('v', '<Space>', '<Nop>', { silent = true })
map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- greatest remap ever
map("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
map("n", "<leader>c", [["+y]])
map("v", "<leader>c", [["+y]])
map("n", "<leader>Y", [["+Y]])
map("n", "<leader>d", [["_d]])
map("v", "<leader>d", [["_d]])
map("n", "<leader>v", [["+p]])
map("v", "<leader>v", [["+p]])
--map({"n", "v"}, "<leader>z", [[za]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

--map("n", "<leader>k", "<cmd>lnext<CR>zz")
--map("n", "<leader>j", "<cmd>lprev<CR>zz")
map("n", "<leader>sh", ":.!")

-- tmux
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- cheatsheet
map("n", "<C-z>", "<cmd>silent !tmux neww cht.sh -qs<CR>")
