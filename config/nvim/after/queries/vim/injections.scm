; extends
((map_statement
  rhs: (map_side) @vim)
 (#match? @vim "^:.+<CR>")
 (#offset! @vim 0 1 0 -4))
