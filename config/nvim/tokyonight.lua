require("tokyonight").setup({
  styles = {comments = "None"},
  sidebars = {"qf"},
  on_highlights = function(hl, c)
    hl["@punctuation.special.rst"] = { fg = c.orange, style = "bold" }
  end,
})
