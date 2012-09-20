
syn keyword	expStatement	expect send Gate keeper spawn parent
syn keyword	expType		expect_out sending

syn region  expString	start=+"+  end=+"+

hi def link expStatement	Statement
hi def link expType		Type
hi def link expString		String


let b:current_syntax = "explog"

