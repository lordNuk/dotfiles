return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local ts = require("telescope.builtin")
        vim.keymap.set('n', '<leader>pf', ts.find_files, {})
        vim.keymap.set('n', '<leader>pg', ts.live_grep, {})
    end
}
