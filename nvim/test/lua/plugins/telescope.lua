local config = function() 
    local telescope = require('telescope')
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
        },
        pickers = {
            find_files = {
                previewer = false,
                hidden = true,
            },
            live_grep = {
                previewer = false,
            },
            find_buffers = {
                previewer = false,
            },
        },
    })
end

return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = config, 
        keys = {
            vim.keymap.set('n', '<leader>pf', ":Telescope find_files<CR>"),
            vim.keymap.set('n', '<leader>ph', ":Telescope help_tags<CR>"),
            vim.keymap.set('n', '<leader>pg', ":Telescope live_grep<CR>"),
            vim.keymap.set('n', '<leader>pb', ":Telescope buffers<CR>"),
            vim.keymap.set('n', '<leader>pg', ":Telescope live_grep<CR>"),
        },
}
