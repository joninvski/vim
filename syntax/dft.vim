let b:current_syntax = "dft"

syn region dftComment start=/#/ end=/$/
syn keyword dftKeyWord Pi do forall for Implements Uses contained_in
syn keyword dftStatement upon event function
syn match  dftFuntion "[a-zA-Z_][a-zA-Z0-9_]*" contained
syn keyword dftOperator	and in is not or
syn keyword dftOperator	":="
syn keyword dftConditional if for

hi def link dftComment      Comment
hi def link dftKeyWord      Keyword
hi def link dftFunction		Function
hi def link dftStatement    Statement
hi def link dftOperator     Operator
hi def link dftConditional  Conditional
