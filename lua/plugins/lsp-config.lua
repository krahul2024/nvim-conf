return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            local servers = {
                "tsserver", "pyright", "gopls", "jdtls", "clangd", "bashls",
                "vimls", "sqlls", "html", "lua_ls", "solargraph"
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                        -- Mappings.
                        local bufopts = { noremap=true, silent=true, buffer=bufnr }
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
                        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
                        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
                        vim.keymap.set("n", "<space>wl", function()
                            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, bufopts)
                        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
                        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
                        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                    end,
                })
            end

            -- Diagnostic keymaps
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
        end,
    },
}