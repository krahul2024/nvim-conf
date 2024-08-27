return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }, 
    config = function()
        require('telescope').setup{
            defaults = {
                -- Default configurations
            },
            pickers = {
                find_files = {
                    -- Configurations for find_files
                },
                live_grep = {
                    additional_args = function(opts)
                        return {"--hidden"}
                    end
                },
            },
        }

        vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
        vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
    end
    }, 
    {
        "nvim-telescope/telescope-ui-select.nvim", 
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown{
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}   
