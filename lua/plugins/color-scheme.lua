return { 
    "Mofiqul/vscode.nvim", name = "vscode",
    config = function()
        vim.cmd("colorscheme vscode")
        vim.g.vscode_italic_comment = 1
        vim.g.vscode_style = "dark"  
    end
}
