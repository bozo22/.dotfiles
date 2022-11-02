-- Github light
require('github-theme').setup({
  theme_style = "light_default",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  overrides = function(c)
     return {
      BufferCurrent = {style = "bold"},
      BufferCurrentMod = {style = "bold", fg = c.warning},
--      BufferTabpageFill = {bg = c.bg}
      CursorLine = {bg = c.bg2},
      -- VertSplit = {fg = c.bg}
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
