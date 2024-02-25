return {
    {
        "windwp/nvim-ts-autotag",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "go",
                    "javascript",
                    "lua",
                    "python",
                    "typescript",
                    "tsx",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                -- enable autoclose html tags thanks to nvim-ts-autotag
                autotag = {
                    enable = true,
                },
            })
        end

    }
}
