return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local config = require('nvim-treesitter.configs')
        config.setup({
            auto_install = true,
            sync_install = false, -- this would install packages/parsers synchronously 
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

