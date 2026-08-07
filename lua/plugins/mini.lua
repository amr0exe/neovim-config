return {
    {
        "nvim-mini/mini.pick",
        version = false,
        config = function ()
            local pick = require("mini.pick")
            pick.setup()

            --local k_map = vim.keymap.set
            --k_map("n", "<leader>f", pick.builtin.files, { desc = "Find Files"})
            --k_map("n", "<leader>e", pick.builtin.buffers, { desc = "Find in Buffers"})
            --k_map("n", "<leader>g", pick.builtin.grep_live)
        end
    },
}
