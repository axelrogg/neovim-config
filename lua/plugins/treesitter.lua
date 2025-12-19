return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local nts = require("nvim-treesitter")

        nts.install({
            "astro",
            "c",
            "lua",
            "python",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Don't enable for very large files to prevent lag
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                if ok and stats and stats.size > max_filesize then
                    return
                end

                -- Start Treesitter highlighting
                pcall(vim.treesitter.start, args.buf)
                
                -- Optional: Enable Treesitter folds for this buffer too
                -- vim.wo.foldmethod = 'expr'
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end,
        })


    end
}