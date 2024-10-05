return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup({
            window = {
                position = 'right',
            },
        })
        
        vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>Neotree toggle<CR>', { noremap = true, silent = true })
    end
}
