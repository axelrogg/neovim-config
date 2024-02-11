return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function custom_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- Default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Custom mappings
            vim.keymap.set("n", "<C-k>", api.tree.toggle, opts("Toggle"))
        end
        require("nvim-tree").setup {
            on_attach = custom_attach,
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            }
        }
        vim.keymap.set("n", "<C-k>", ":NvimTreeToggle<Return>")
    end
}
