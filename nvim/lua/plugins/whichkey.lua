return {

    -- TODO: fix the whichkey helper window

    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        -- gain access to the which key plugin
        local which_key = require('which-key')

        -- call the setup function with default properties
        which_key.setup()

        -- Register prefixes for the different key mappings we have setup previously
        which_key.register({
            { "<leader>/", group = "Comments" },
            { "<leader>/_", hidden = true },
            { "<leader>J", group = "[J]ava" },
            { "<leader>J_", hidden = true },
            { "<leader>c", group = "[C]ode" },
            { "<leader>c_", hidden = true },
            { "<leader>d", group = "[D]ebug" },
            { "<leader>d_", hidden = true },
            { "<leader>e", group = "[E]xplorer" },
            { "<leader>e_", hidden = true },
            { "<leader>f", group = "[F]ind" },
            { "<leader>f_", hidden = true },
            { "<leader>p", group = "[P]roject" },
            { "<leader>p_", hidden = true },
            { "<leader>g", group = "[G]it" },
            { "<leader>g_", hidden = true },
            { "<leader>w", group = "[W]indow" },
            { "<leader>w_", hidden = true },
        })
        -- which_key.register({
        --     ['<leader>/'] = {name = "Comments", _ = 'which_key_ignore'},
        --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        --     ['<leader>d'] = {name = '[D]ebug' , _ = 'which_key_ignore' },
        --     ['<leader>e'] = {name = '[E]xplorer', _ = 'which_key_ignore'},
        --     ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        --     ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        --     ['<leader>J'] = { name = '[J]ava', _ = 'which_key_ignore' },
        --     ['<leader>w'] = {name = '[W]indow', _ = 'which_key_ignore'}
        -- })
    end
}
