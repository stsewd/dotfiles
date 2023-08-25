; extends
((map_statement
  rhs: (map_side) @injection.content)
 (#match? @injection.content "^:.+<CR>")
 (#offset! @injection.content 0 1 0 -4)
 (#set! injection.language "vim"))
