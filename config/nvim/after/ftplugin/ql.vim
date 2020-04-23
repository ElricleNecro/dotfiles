" Last Change: 2020 avril 12

" This query Extracts context definitions (like functions, of for example, Rust bracketed contexts)
let b:completion_context_query = ['classlessPredicate', 'class', 'exists', 'predicate']

" This is the name of an identifier node (as shown in treesitter playground), it will be used
let b:completion_ident_type_name = "simpleId"

" This is the query that will be used to search for the definition of
" a given identifier, it is mandatory to have an @def in it to tag the identifier of the declaration.
" The other @-tag will be used to name the completion item during completion
let b:completion_def_query = ['(varDecl varName: (simpleId) @def @v)']

