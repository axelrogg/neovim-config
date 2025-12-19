return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<C-k>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- Apply default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Add your custom "inside the tree" keys
            vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
            vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        end

        require("nvim-tree").setup {
            on_attach = my_on_attach,
            view = {
                side = "right",
                width = 35,
            },
            git = {
                enable = true,
                ignore = false,
            },
        }
    end,
}