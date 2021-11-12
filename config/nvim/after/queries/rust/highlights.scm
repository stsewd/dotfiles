((impl_item (declaration_list (function_item (identifier) @constructor)))
 (#eq? @constructor "new"))

(call_expression
  function: (scoped_identifier
    name: (identifier) @constructor)
 (#eq? @constructor "new"))
