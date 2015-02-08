" ML basis syntax file.
"
" Andy Morris <andy@adradh.org.uk>
" 29th April 2010


if version < 600
    syn clear
elseif exists("b:current_syntax") && b:current_syntax == "mlb"
    finish
endif

setlocal iskeyword+=_,'

hi def link mlbStructure Include
syn match mlbStructure contains=mlbStructureEq,mlbStructureKW
      \ '\(structure\|signature\|functor\|basis\)\_s\+\k\+\(\_s*=\_s*\k\+\)\?'
syn match mlbStructure contains=mlbOpenKW 'open\_s\+\k'

hi def link mlbStructureEq Keyword
syn match mlbStructureEq '='

hi def link mlbStructureKW Keyword
syn keyword mlbStructureKW structure signature functor basis contained

hi def link mlbOpenKW Keyword
syn keyword mlbOpenKW open contained

hi def link mlbBlock Keyword
syn keyword mlbBlock ann bas local let and in end

hi def link mlbString String
syn region mlbString start=+"+ end=+"+ skip=+\\"+ contains=mlbStringEsc,mlbPathVar

hi def link mlbStringEsc Special
syn match mlbStringEsc '\\"\|\\\_s*\\'

hi def link mlbPath String
syn match mlbPath '\([$()]\|\f\)\+\.\(mlb\|sml\|sig\|fun\)\>' contains=mlbPathVar

hi def link mlbPathVar Special
syn match mlbPathVar '$(\w\+)' contained

hi def link mlbSemi Delimiter
syn match mlbSemi ';'

hi def link mlbComment Comment
syn region mlbComment start="(\*" end="\*)" contains=mlbComment

" XXX blehhh
setlocal autoindent copyindent
