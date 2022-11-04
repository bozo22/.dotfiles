-- Github light
require('github-theme').setup({
  theme_style = "light_default",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  overrides = function(c)
     return {
      BufferCurrent = {style = "bold"},
      BufferCurrentMod = {style = "bold", fg = c.warning},
--     BufferTabpageFill = {bg = c.bg},
--      CursorLine = {bg = c.bg2},
--      VertSplit = {fg = c.bg}
    }
  end
})

-- Newpaper
--[[ require("newpaper").setup({
    style               = "light",
    editor_better_view  = true,
    terminal            = "contrast",
    sidebars_contrast   = {},
    contrast_float      = true,
    contrast_telescope  = true,
    operators_bold      = true,
    keywords            = "bold",
    tags                = "bold",
    tex_major           = "bold",
    tex_operators_bold  = true,
    tex_keywords        = "NONE",
    tex_zone            = "italic",
    tex_arg             = "italic",
    error_highlight     = "undercurl",
    italic_strings      = true,
    italic_comments     = true,
    italic_functions    = false,
    italic_variables    = false,
    borders             = true,
    disable_background  = false,
    lsp_virtual_text_bg = true,
    hide_eob            = false,
    colors              = {},
    colors_advanced     = {},
    custom_highlights   = {},
    lualine_bold        = true,
    lualine_style       = "light",
    devicons_custom     = {},
}) ]]

-- Hemisu
-- vim.cmd("colorscheme hemisu")

-- Doom one
-- vim.g.doom_one_cursor_coloring = false
-- -- Set :terminal colors
-- vim.g.doom_one_terminal_colors = true
-- -- Enable italic comments
-- vim.g.doom_one_italic_comments = false
-- -- Enable TS support
-- vim.g.doom_one_enable_treesitter = true
-- -- Color whole diagnostic text or only underline
-- vim.g.doom_one_diagnostics_text_color = false
-- -- Enable transparent background
-- vim.g.doom_one_transparent_background = false
--
-- -- Pumblend transparency
-- vim.g.doom_one_pumblend_enable = false
-- vim.g.doom_one_pumblend_transparency = 20
--
-- -- Plugins integration
-- vim.g.doom_one_plugin_neorg = true
-- vim.g.doom_one_plugin_barbar = false
-- vim.g.doom_one_plugin_telescope = false
-- vim.g.doom_one_plugin_neogit = true
-- vim.g.doom_one_plugin_nvim_tree = true
-- vim.g.doom_one_plugin_dashboard = true
-- vim.g.doom_one_plugin_startify = true
-- vim.g.doom_one_plugin_whichkey = true
-- vim.g.doom_one_plugin_indent_blankline = true
-- vim.g.doom_one_plugin_vim_illuminate = true
-- vim.g.doom_one_plugin_lspsaga = false
--
-- vim.cmd("colorscheme doom-one")
