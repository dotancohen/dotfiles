"" Changes here should be changed in the insert-mode toggle below as well
let g:completeLoopStructures=1
iab if <C-R>=CompleteFlowControlNoComments("if")<CR>
iab for <C-R>=CompleteFlowControlNoComments("for")<CR>
iab foreach <C-R>=CompleteFlowControlNoComments("foreach")<CR>
iab do <C-R>=CompleteFlowControlNoComments("do")<CR>
iab while <C-R>=CompleteFlowControlNoComments("while")<CR>

"Example of old usage
"iab <buffer> <expr> if =CompleteFlowControlNoComments("if", "if<Space>()<left><Space>{{<Esc>kA<Left><Left><Left><Left><C-R>=Eatchar('\s')<CR>")
