"
" SML/NJ Compilation Manager syntax file
"

if exists('b:current_syntax')
  finish
endif

setlocal isk+='

syn case match

syn keyword cmStructure Library nextgroup=cmLibVersion skipwhite skipempty
syn keyword cmStructure Group nextgroup=cmGroupParent skipwhite skipempty
syn keyword cmStructure is
hi def link cmStructure Structure

syn region cmGroupVersion matchgroup=cmDelim start='(' end=')' contained
  \ contains=cmGroupVersion0
syn match cmGroupVersion0 '\d\+\(\.\d\+\)*' contained
hi def link cmGroupVersion0 Number

syn region cmGroupParent matchgroup=cmDelim start='(' end=')' contained
hi def link cmGroupParent cmFilename
hi def link cmDelim Delimiter

syn match cmFilename '\(\k\|[-.$/]\)\+\.\(sml\|sig\|fun\|cm\)' contains=cmAnchor
  \ nextgroup=cmTools skipwhite skipempty
syn region cmFilename start='"' end='"' contains=cmAnchor
  \ nextgroup=cmTools skipwhite skipempty
syn match cmFilename '\(\k\|[-.$/]\)*/\(\k\|[-.$/]\)*'
  \ nextgroup=cmTools skipwhite skipempty
hi def link cmFilename String

syn match cmAnchor '\$\(\k\|-\)*'
hi def link cmAnchor SpecialChar

syn keyword cmObject nextgroup=cmObjName signature structure functor funsig
  \ skipwhite skipempty
hi def link cmObject Keyword

syn match cmObjName '\k\+' contained
hi def link cmObjName PreProc

syn region cmTools matchgroup=cmDelim start='(\*\@!' end='*\@<!)' contained
  \ contains=cmToolName,cmFilename,cmAnchor,cmTools
syn match cmToolName contained '\k\+:'
hi def link cmToolName Identifier

syn match cmExportOp '*\|-'
hi def link cmExportOp Operator

syn keyword cmExportFun source group library
hi def link cmExportFun Keyword

syn region cmComment start='(\*' end='\*)' contains=cmComment
hi def link cmComment Comment


let b:current_syntax = 'cm'
