((user_command (command_name) @_command_name (arguments) @javascript)
 (#eq? @_command_name "Plug"))

((map_statement
  rhs: (map_side) @vim)
 (#match? @vim "^:.+<CR>")
 (#offset! @vim 0 1 0 -4))
