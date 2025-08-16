return {
    {
        "nvim-lualine/lualine.nvim",
        config = function() 
            require("lualine").setup({
                options = {
                    theme = "iceberg_dark",
                    section_separators = {'|', '|'},
                    component_separators = {'|', '|'}
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch'},
                    lualine_c = {
                        { 'filename', path = 1},
                    },
                    lualine_x = { 
                        'searchcount',
                        {
                            "diagnostics",
                            sources = {  'nvim_lsp', },
                            sections = { 'error','warn', 'info'},
                            diagnostics_color = {
                                error = 'diagnosticerror',
                                warn = 'diagnosticwarn',
                                info = 'diagnosticinfo',
                            },
                            update_in_insert = true,
                            colored = false,
                        }
                    },
                    lualine_y = { 'filetype', 'location'},
                    lualine_z = { 'progress'}
                }
            })
        end
    }
}
