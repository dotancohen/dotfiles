" 2014-10-07
" In git dotfiles!

"Press \a to find non-ascii characters
"Press \d to insert debug() function calls
"Press \id to insert debug() function
"Press ^R in Visual mode to replace selected text
"Press ^6 to begin command-line mode Caps Lock.
"Press j to cancel autocomplete of () {} [] '' ""
"Press ^N to enable DynamicMarks and relative line numbers
"Press \// to comment the current line and copy it below
"Press ,, to add another method argument while inside quotes
"Press ,., to add => while inside quotes (PHP associative arrays)
"Press kk to go to end of line, hh to return to last empty element
"HTML elements: Regular ,.. | W/ Newlines ,.<Return> | Self-closing ,./
"Press \b for :b# (previous buffer)
"Press \l for :ls (previous buffer)

"To search for unusual letter combinations, grep /usr/share/dict/
" Also: http://web.archive.org/web/20081226163912/http://jeff560.tripod.com/words7.html

"Currently broken: function name in status line
"Currently broken: cygwin target
"To Add: close single/double quote only if the preceding character is not alphanumeric
"To Add: Closing () only if the next character is whitespace or end of line



" Things to bring back home
"set clipboard=unnamed "This puts everything into + register. This was horrible!
set shell=/bin/bash\ -l



" Things to change per install
set noswapfile
set tags=~/tags
"set nobackup
"set nowritebackup



execute pathogen#infect()
set nocompatible
set noexpandtab
set hidden
set smartindent
set ignorecase
set smartcase
set nu
set incsearch
set tabstop=4
set shiftwidth=4
set enc=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set history=500
set scrolloff=3
set listchars=tab:._,trail:.
set foldmethod=manual foldmarker={,} foldlevel=15
"set t_ti= t_te=
colorscheme desert
set cursorline
set showcmd " show (partial) commands
let mapleader = '\'
let g:solarized_termcolors=256
filetype plugin on
syntax on
"hi CursorLine term=none cterm=none ctermbg=20
hi CursorLine term=none cterm=none ctermbg=DarkBlue

"cmap w!! %!sudo tee > /dev/null %
cmap w!! exec 'w !sudo dd of=' . shellescape(expand('%'))


"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" Git commit messages

autocmd BufNewFile,BufRead COMMIT_EDITMSG set paste
autocmd BufLeave COMMIT_EDITMSG set nopaste


" Nerdtree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <leader>\ <Esc>:NERDTreeToggle<Return>


" PHP

:au BufNewFile,BufRead *.html set filetype=php
"Press \// to comment the current line and copy it below
:au BufNewFile,BufRead *.php noremap <leader>// <Esc>YpkI//<space><Esc>j0
:au BufNewFile,BufRead *.html noremap <leader>// <Esc>YpkI//<space><Esc>j0



" Python

"Press \// to comment the current line and copy it below
:au BufNewFile,BufRead *.py noremap <leader>// <Esc>YpkI#<space><Esc>j0



" Signs

let g:Signs_Bookmarks = 1
let g:Signs_MixedIndentation = 1
let g:Signs_Diff = 1


" Tagslist

let Tlist_Close_On_Select = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
nnoremap <leader><space> <Esc>:TlistToggle<Return>



" Set status line here

" Wanted: FunctionName   Buffer#/Total   #MarksSet   !UnixFile !UTF8   -align-  Scrollbar
"set ruler " show the cursor position all the time
"set statusline+=%{WhatFunctionAreWeIn()}
"set statusline=%{PHP_Cursor_Position()}
set statusline+=\ %9*%{&ff=='unix'?'':&ff.'\ format'}%* "Highligh non-UNIX files
set laststatus=2 " Always show the status line at the bottom of the screen
set stl=%!STL()



nnoremap , :
nnoremap <Space> <C-F>
nnoremap <Backspace> <C-B>
nnoremap <Tab> $%
nnoremap <leader>b :b#<Return>
nnoremap <leader>l :ls<Return>


"For maintaining Sara and Bassy's code
"http://superuser.com/questions/692969/position-cursor-at-end-of-variable-or-array-member
nnoremap \bb /^\s*if.*;$<Return>
nnoremap \bf /iff(%lDa {}Op==
nnoremap \be /iff(%lDa {}Op==jJelDa {}Op==
nnoremap \bs <Esc>O$sql = ;<Esc>==jf"lda"i$sql<Esc>k$P
"nnoremap \bg /[^ ]=[^" ]<Return>a <Esc>la <Esc>
"nnoremap \bg /\$[a-zA-Z0-9_]*=<Return>ea <Esc>ea <Esc>





"For vBulletin
inoremap $vb $vbulletin->

"Press c to replace object syntax with array syntax
"nmap c xxi['<Esc>ea']<Esc>/-><Return>

"Press \d to insert debug() function calls
nnoremap <leader>d <Esc>Odebug($);<Left><Left>

"Press \id to insert debug() function
nnoremap <leader>id <Esc>Ofunction debug($var)<Return>{<Return>echo "<pre>";<Return>var_dump($var);<Return>echo "</pre>";<Return>return TRUE;<Return>}<Return><Return>


"Press ^R in Visual mode to replace selected text
vnoremap <C-r> "py:%s/<C-r>p//gc<left><left><left>

"Press \s to upper-case common SQL keywords on the current line
noremap <leader>s <Esc>:s/\v<(select\|from\|insert\|into\|table\|where\|delete\|limit\|order\|by\|asc\|desc\|set\|update\|ignore\|values)>/\U\0/g<Return>

"Press \c to upper-case all SQL keywords on the current line
noremap <leader>c <Esc>:s/\v<(false\|null\|true\|access\|add\|as\|asc\|begin\|by\|check\|cluster\|column\|compress\|connect\|current\|cursor\|decimal\|default\|desc\|else\|elsif\|end\|exception\|exclusive\|file\|for\|from\|function\|group\|having\|identified\|if\|immediate\|increment\|index\|initial\|into\|is\|level\|loop\|maxextents\|mode\|modify\|nocompress\|nowait\|of\|offline\|on\|online\|start\|successful\|synonym\|table\|then\|to\|trigger\|uid\|unique\|user\|validate\|values\|view\|whenever\|where\|with\|option\|order\|pctfree\|privileges\|procedure\|public\|resource\|return\|row\|rowlabel\|rownum\|rows\|session\|share\|size\|smallint\|type\|using\|not\|and\|or\|in\|any\|some\|all\|between\|exists\|like\|escape\|union\|intersect\|minus\|prior\|distinct\|sysdate\|out\|alter\|analyze\|audit\|comment\|commit\|create\|delete\|drop\|execute\|explain\|grant\|insert\|lock\|noaudit\|rename\|revoke\|rollback\|savepoint\|select\|set\|truncate\|update\|boolean\|char\|character\|date\|float\|integer\|long\|mlslabel\|number\|raw\|rowid\|varchar\|varchar2\|varray\|int\|auto_increment\|primary\|key\|limit\|ignore\|datetime\|database\|collate\|references\|cascade\|concat\|prepare\|declare\|delimiter\|last_insert_id)>/\U\0/g<Return>



inoremap ii <Esc>
inoremap kk <Esc>A
inoremap jh <Left>
inoremap jl <Right>



" Make nice HTML and XML tags

"regular elements
"inoremap ,.. <esc>diwi<<esc>pa><Return></><esc>PkA<C-o>gJ
inoremap ,.. <esc>diwa<<C-o>p></><left><C-o>P<C-o>b<left><left>
"regular elements with newlines between the matching elements
inoremap ,.<Return> <esc>diwa<<esc>pa><Return><Return></><esc>PkA
"self-closing elements
inoremap ,./ <esc>diwa<<esc>pa<space>/><left><left>



"Go back to between the last {} [] <> >< () "" '' or >< (redundant?)
inoremap jk <c-o>?\({\s*}\\|\[\s*]\\|<\s*>\\|>\s*<\\|(\s*)\\|"\s*"\\|'\s*'\\|>\s*<lt>\)?s+1<Return>
"Go back to between the last {} [] <> >< () "" '' or >< (redundant?) on the current line
inoremap hh <c-o>?\%<c-r>=line('.')<Return>l\({}\\|\[]\\|<>\\|><\\|()\\|""\\|''\\|><lt>\)?s+1<Return>
inoremap hh<Space> <c-o>?\%<c-r>=line('.')<Return>l\({}\\|\[]\\|<>\\|><\\|()\\|""\\|''\\|><lt>\)?s+1<Return><Space><Space><Left>
inoremap hh<Return> <c-o>?\%<c-r>=line('.')<Return>l\({}\\|\[]\\|<>\\|><\\|()\\|""\\|''\\|><lt>\)?s+1<Return><Return><C-o>O
"For adding another method argument while inside quotes
"inoremap ,, <Right>,<Space>
inoremap ,, <Esc>/"\\|'<Return>a,<Space>
"For adding => while inside quotes (PHP associative arrays)
inoremap ,., <Right><Space>=><Space>
inoremap ;; <Esc>A;<Return>
inoremap <Tab> <c-r>=InsertTabWrapper()<Return>



"Navigating {} blocks
inoremap {{  <Esc>A<Space>{<Return>}<Esc>O
inoremap jj <Esc>/{<Return>jA'<Esc>==A<Backspace>
inoremap ;e; ;<Esc>]}a<Space>else<Space>{<Return>}<Esc>O
inoremap ;j; ;<Esc>]}o



inoremap {      {}<Left>
inoremap {<Space>      {  }<Left><Left>
inoremap {<Return>  {<Return>}<Esc>O
inoremap {j     {
inoremap {}     {}

inoremap [      []<Left>
inoremap [<Space>      [  ]<Left><Left>
inoremap [<Return>  [<Return>]<Esc>O
inoremap [j     [
inoremap []     []

inoremap (      ()<Left>
inoremap (<Space>      (  )<Left><Left>
inoremap (<Return>  (<Return>)<Esc>O<Tab>
inoremap (j     (
inoremap ()     ()

inoremap "      ""<Left>
inoremap "<Return>  "<Return>"<Esc>O
inoremap "j     "
inoremap ""     ""

inoremap '      ''<Left>
inoremap '<Return>  '<Return>'<Esc>O
inoremap 'j     '
inoremap ''     ''



"inoremap <F1> <C-o>:set nu! paste!<Return>
"nnoremap <F1> :set nu! paste!<Return>
inoremap <F1> <C-o>:call TripleToggleInsertMode()<cr>
nnoremap <F1> :call TripleToggleInsertMode()<cr>

inoremap <F4> <Esc>ggVG"+y
nnoremap <F4> <Esc>ggVG"+y

inoremap <F5> <Esc>mP<Esc>:call searchpair('<!\[CDATA\[\zs', '', '\ze]]>', 'b')<Return><Space>v:<C-u>call searchpair('<!\[CDATA\[\zs', '', '\ze]]>')<Return><Backspace>v`<ox:new<Return>p:set nu<Return>:set ft=php<Return>ggi<?php<Return><Esc><C-w>_3<C-w>-
nnoremap <F5> <Esc>mP<Esc>:call searchpair('<!\[CDATA\[\zs', '', '\ze]]>', 'b')<Return><Space>v:<C-u>call searchpair('<!\[CDATA\[\zs', '', '\ze]]>')<Return><Backspace>v`<ox:new<Return>p:set nu<Return>:set ft=php<Return>ggi<?php<Return><Esc><C-w>_3<C-w>-
inoremap <F6> <Esc>ggdd<S-V>Gx:bd!<Return>`PP
nnoremap <F6> <Esc>ggdd<S-V>Gx:bd!<Return>`PP

inoremap <F7> <Esc>mO<C-V>aBy:new<Return>p:set nu<Return>:set ft=php<Return>ggi<?php<Return><Esc><C-w>_3<C-w>-
nnoremap <F7> <Esc>mO<C-V>aBy:new<Return>p:set nu<Return>:set ft=php<Return>ggi<?php<Return><Esc><C-w>_3<C-w>-
inoremap <F8> <Esc>ggdd<C-V>aBx:bd!<Return>`O<C-V>aBp
nnoremap <F8> <Esc>ggdd<C-V>aBx:bd!<Return>`O<C-V>aBp



" Ctrl-N to toggle relative line numbers
" Now done on F1 triple-toggle!
"inoremap <C-n> <C-o>:call NumberToggle()<cr>
"nnoremap <C-n> :call NumberToggle()<cr>
function! NumberToggle()
	if(&relativenumber== 1)
		set number
		execute ":Signs"
		execute ":DisableSigns"
	else
		set relativenumber
		execute ":Signs"
	endif
	echo ""
endfunc



if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif



" Insert and command-line mode Caps Lock.
set imsearch=-1                       " Lock search keymap to be the same as insert mode.
set keymap=insert-only_capslock       " Load the keymap that acts like capslock.
set iminsert=0                        " Turn it off by default.
autocmd InsertLeave * set iminsert=0  " Kill the capslock when leaving insert mode.
:highlight Cursor guifg=NONE guibg=Green
:highlight lCursor guifg=NONE guibg=Cyan



" Set specific word to highlight even after cursor leaves
map <Leader>H :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>gH :let @/ = expand('<cword>')\|set hlsearch<C-M>

" Highlight word under cursor
map <Leader>h :call HighlightCurrentWord()<cr>
let g:toggleHighlightCurrentWord=1
function! HighlightCurrentWord()

	if g:toggleHighlightCurrentWord==1
		:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
		let g:toggleHighlightCurrentWord=3
	endif

	if g:toggleHighlightCurrentWord==2
		"TODO This is sloppy! Figure out the real way to cancel the highlight!
		:autocmd CursorMoved * exe printf('match IncSearch /\V\asdfghjkl<%s\>/', escape(expand('<cword>'), '/\'))
		let g:toggleHighlightCurrentWord=1
	endif

	if g:toggleHighlightCurrentWord==3
		let g:toggleHighlightCurrentWord=2
	endif

endfunction



" Triple-toggle Insert Modes
let g:insertModeGlobal=1
function! TripleToggleInsertMode()

	if g:insertModeGlobal==3
		" Was in paste/CAPS insert mode, go to coding insert mode

		set nu
		set nopaste
		normal <C-^>

		let g:insertModeGlobal=4
	endif


	if g:insertModeGlobal==2
		" Was in prose insert mode, go to paste/CAPS insert mode

		set nospell
		set nolinebreak
		nunmap j
		nunmap k
		nunmap gj
		nunmap gk
		inoremap '      ''<Left>
		inoremap '<Return>  '<Return>'<Esc>O
		inoremap 'j     '
		inoremap ''     ''
		call NumberToggle()
		if g:completeLoopStructures=1
			iab if <C-R>=CompleteFlowControlNoComments("if")<CR>
			iab for <C-R>=CompleteFlowControlNoComments("for")<CR>
			iab foreach <C-R>=CompleteFlowControlNoComments("foreach")<CR>
			iab do <C-R>=CompleteFlowControlNoComments("do")<CR>
			iab while <C-R>=CompleteFlowControlNoComments("while")<CR>
		endif

		set nonu
		set paste
		normal <C-^>

		let g:insertModeGlobal=3
	endif

	if g:insertModeGlobal==1
		" Was in coding insert mode, go to prose insert mode

		set spell
		set linebreak
		nnoremap j gj
		nnoremap k gk
		nnoremap gj j
		nnoremap gk k
		iunmap '
		iunmap '<Return>
		iunmap 'j
		iunmap ''
		call NumberToggle()
		if g:completeLoopStructures=1
			iab do do
			iab for for
			iab foreach foreach
			iab if if
			iab while while
		endif

		let g:insertModeGlobal=2
	endif

	if g:insertModeGlobal==4
		let g:insertModeGlobal=1
	endif

endfunction





"http://superuser.com/questions/423673/vim-tab-as-omnicomplete-but-not-at-beginning-of-line/423744#423744
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction



" Show the current function being edited in the status line
function! WhatFunctionAreWeIn()
	" http://vim.wikia.com/wiki/VimTip1296
	" http://stackoverflow.com/questions/9728199/why-does-this-function-skip-on-line-63
	let strList = ["while", "foreach", "ifelse", "if else", "for", "if", "else", "try", "catch", "case"]
	let foundcontrol = 1
	" let position = ""
	let pos=getpos(".")          " This saves the cursor position
	let view=winsaveview()       " This saves the window view

	while (foundcontrol)

		let foundcontrol = 0
		normal [{
		call search('\S','bW')

		let tempchar = getline(".")[col(".") - 1]
		if (match(tempchar, ")") >=0 )
			normal %
			call search('\S','bW')
		endif

		let tempstring = getline(".")

		for item in strList
			if( match(tempstring,item) >= 0 )
				" let position = item . " - " . position
				let foundcontrol = 1
				break
			endif
		endfor

		if(foundcontrol == 0)
			call cursor(pos)
			call winrestview(view)
			" return tempstring.position
			return tempstring
		endif
	endwhile
	call cursor(pos)
	call winrestview(view)
	" return tempstring.position
	return tempstring
endfun



function! PHP_Cursor_Position()
	let pos = getpos(".")
	let curline = pos[1]
	let win = winsaveview()
	let decl = ""
	let startline = search('^\s*\(static\|public\|private\)\=\s*\(static\|public\|private\)\=\s*\(static\|public\|private\)\=\s*\(function\|class\)\s*&\=\w\+','cbW')
	call search('{','cW')
	sil exe "normal %"
	let endline = line(".")
	if curline >= startline && curline <= endline
		let decl = getline(startline)
	endif
	call cursor(pos)
	call winrestview(win)
	return decl
endfunction



" Consume space after iab abbreviations
function! Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc



" Add current buffer number and count of all buffers to ruler
let g:zbuflistcount = 0
set rulerformat=%22(%{g:zbuflistcount};%M%n\ %=%l,%c%V\ %P%)
autocmd BufAdd * let g:zbuflistcount += 1
autocmd BufDelete * let g:zbuflistcount -= 1
autocmd VimEnter * call UpdateZBufLC()
function! UpdateZBufLC()
	let lst = range(1, bufnr('$'))
	call filter(lst, 'buflisted(v:val)')
	let g:zbuflistcount = len(lst)
endfunction



" Complete flow control structures such as for(){} outside comments, but not inside
"function! CompleteFlowControlNoComments(abbr,str)
function! CompleteFlowControlNoComments(abbr)
	if g:insertModeGlobal==2
        return a:abbr
	endif

    let syn = synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 1)), 'name')

    if syn ==? 'comment' || syn ==? 'constant'
        return a:abbr
    else
        "return a:str
        return a:abbr . " ( ) {\<CR>\<CR>}\<Esc>kkA\<Left>\<Left>\<Left>\<Left>"
    endif
endfunction



" A visual scrollbar in the statusline (courtesy of A.Politz)
func! STL()
	let stl = '%f [%{(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?",B":"")}%M%R%H%W] %y [%l/%L,%v] [%p%%]'
	let barWidth = &columns - 45 " <-- wild guess was 65
	let barWidth = barWidth < 3 ? 3 : barWidth

	if line('$') > 1
		let progress = (line('.')-1) * (barWidth-1) / (line('$')-1)
	else
		let progress = barWidth/2
	endif

	" line + vcol + %
	let pad = strlen(line('$'))-strlen(line('.')) + 3 - strlen(virtcol('.')) + 3 - strlen(line('.')*100/line('$'))
	let bar = repeat(' ',pad).' [%1*%'.barWidth.'.'.barWidth.'('
			\.repeat('-',progress )
			\.'%2*0%1*'
			\.repeat('-',barWidth - progress - 1).'%0*%)%<]'
	return stl.bar
endfun
hi def link User1 DiffAdd
hi def link User2 DiffDelete



" MATCH INTERESTING AND SIGNIFICANT CHARACTERS

" Match characters past the 108th column
" \%108v.\+

" Match trailing whitespace
" \s\+$

" Match non-ascii characters
" [^\x00-\x7F]

highlight InterestingCharacters ctermbg=darkblue guibg=darkblue
"highlight InterestingCharacters ctermbg=red guibg=red
"highlight InterestingCharacters guibg=Red ctermbg=2
match InterestingCharacters /\%108v.\+\|\s\+$\|[^\x00-\x7F]/
autocmd BufWinEnter * match InterestingCharacters /\%108v.\+\|\s\+$\|[^\x00-\x7F]/
autocmd InsertEnter * match InterestingCharacters /\%108v.\+\|\s\+$\|[^\x00-\x7F]/
autocmd InsertLeave * match InterestingCharacters /\%108v.\+\|\s\+$\|[^\x00-\x7F]/
autocmd BufWinLeave * call clearmatches()



" Find non-ascii characters in file
" http://stackoverflow.com/a/17133637/343302

function! FindNonAscii()
	normal /[^\x00-\x7F]
endfunction
nnoremap <leader>a :call FindNonAscii()<CR>




" Specific environment settings below

if &diff " For vimdiff
    colorscheme evening
endif



if has('gui_running')
	set guioptions-=T
	set guifont=DejaVu\ Sans\ Mono\ 11
	set paste

	"http://superuser.com/questions/461009/different-size-text-for-different-lines-gvim-or-any-other-ide
	":highlight CurrentLines gui=bold
	":autocmd CursorMoved * :execute 'match CurrentLines /.*\n.*\%#.*\n.*/'
	":autocmd CursorMovedI * :execute 'match CurrentLines /.*\n.*\%#.*\n.*/'
endif



if has('cygwin') " This probably does not work, need to check how to target cygwin
	set enc=utf-8
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf8,prc
	set guifont=Lucida_Console:h16
	set guifontwide=Courier_New:h16
	set shell=C:/cygwin/bin/bash
endif



if has("win32") || has("win64")
   set directory=$TMP
else
   set directory=$HOME/.tmp
endif



" VimWiki

autocmd FileType vimwiki set nonu
autocmd FileType vimwiki :NERDTree ~/.vimwiki

let wiki_1 = {}

" non-HTML-related options
let wiki_1.path = '~/.vimwiki/test/'
let wiki_1.index = 'Test'
let wiki_1.nested_syntaxes = {'python': 'python', 'php': 'php'}
"let wiki_1.syntax = 'markdown'
"let wiki_1.ext = '.mdox'

" HTML-related options
let wiki_1.path_html = '~/public_html/vimwiki/test/'
let wiki_1.auto_export = 1
"let wiki_1.html_template = '~/public_html/template.tpl'
"let wiki_1.template_path = '~/public_html/templates'
"let wiki_1.template_default = 'default_template'
"let wiki_1.template_ext = '.html'
"let wiki_1.css_name = 'style.css'
"let wiki_1.maxhi = 1

let wiki_2 = {}

let g:vimwiki_list = [wiki_1, wiki_2]



