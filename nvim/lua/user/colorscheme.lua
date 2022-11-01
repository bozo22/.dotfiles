require('github-theme').setup({
  theme_style = "light_default",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  overrides = function(c)
     return {
      BufferCurrent = {style = "bold"},
      BufferCurrentMod = {style = "bold", fg = c.warning},
--      BufferTabpageFill = {bg = c.bg}
    }
  end
})
