return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

      local Terminal = require("toggleterm.terminal").Terminal

      -- Vertical terminal
      local vertical_term = Terminal:new({
        direction = "vertical",
        size = function(term)
          return vim.o.columns * 0.4
        end,
      })

      function _vertical_toggle()
        vertical_term:toggle()
      end

      -- Horizontal terminal
      local horizontal_term = Terminal:new({
        direction = "horizontal",
        size = function(term)
          return vim.o.lines * 0.3
        end,
      })

      function _horizontal_toggle()
        horizontal_term:toggle()
      end

      -- Floating terminal
      local float_term = Terminal:new({
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _float_toggle()
        float_term:toggle()
      end

      -- Lazygit terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      -- Key mappings
      vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>lua _vertical_toggle()<CR>", {noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua _horizontal_toggle()<CR>", {noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua _float_toggle()<CR>", {noremap = true, silent = true})

    end,
  },
}
