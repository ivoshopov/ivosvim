" Vim syntax file
" Language:	texitpl (macro package for TeX)
" Maintainer:	Sandor Kopanyi <sandor.kopanyi@mailbox.hu>
" URL:		<->
" Last Change:	2004 Jun 23
"
" the file follows the texitpl manual structure; this file is based
" on manual for texitpl version 4.0, 28 September 1999
" since @ can have special meanings, everything is 'match'-ed and 'region'-ed
" (including @ in 'iskeyword' option has unexpected effects)

" Remove any old syntax stuff hanging around, if needed
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'texitpl'
endif

"in texitpl can be real big things, like tables; sync for that
syn sync lines=200

"some general stuff
"syn match texitplError     "\S" contained TODO
syn match texitplIdent	    "\k\+"		  contained "IDENTifier
syn match texitplAssignment "\k\+\s*=\s*\k\+\s*$" contained "assigment statement ( var = val )
syn match texitplSinglePar  "\k\+\s*$"		  contained "single parameter (used for several @-commands)
syn match texitplIndexPar   "\k\k\s*$"		  contained "param. used for different *index commands (+ @documentlanguage command)


"marking words and phrases (chap. 9 in texitpl manual)
"(almost) everything appears as 'contained' too; is for tables (@table)

"this chapter is at the beginning of this file to avoid overwritings

syn match texitplSpecialChar				    "@acronym"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@acronym{" end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@b"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@b{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@cite"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@cite{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@code"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@code{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@command"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@command{" end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@dfn"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@dfn{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@email"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@email{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@emph"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@emph{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@env"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@env{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@file"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@file{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@i"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@i{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@kbd"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@kbd{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@key"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@key{"	end="}" contains=texitplSpecialChar
syn match texitplSpecialChar				    "@option"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@option{"	end="}" contains=texitplSpecialChar
syn match texitplSpecialChar				    "@r"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@r{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@samp"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@samp{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@sc"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@sc{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@strong"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@strong{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@t"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@t{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@url"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@url{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplSpecialChar				    "@var"		contained
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@var{"	end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn match texitplAtCmd "^@kbdinputstyle" nextgroup=texitplSinglePar skipwhite


"overview of texitpl (chap. 1 in texitpl manual)
syn match texitplComment  "@c .*"
syn match texitplComment  "@c$"
syn match texitplComment  "@comment .*"
syn match texitplComment  "\[= [^]]* =\]"
syn region texitplMltlnAtCmd matchgroup=texitplComment start="^@ignore\s*$" end="^@end ignore\s*$" contains=ALL


"beginning a texitpl file (chap. 3 in texitpl manual)
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="@center "		 skip="\\$" end="$"		       contains=texitplSpecialChar,texitplBrcPrmAtCmd oneline
syn region texitplMltlnDMAtCmd matchgroup=texitplAtCmd start="^@detailmenu\s*$"		    end="^@end detailmenu\s*$" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="^@setfilename "    skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="^@settitle "       skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="^@shorttitlepage " skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="^@title "		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplBrcPrmAtCmd  matchgroup=texitplAtCmd start="@titlefont{"		    end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplMltlnAtCmd   matchgroup=texitplAtCmd start="^@titlepage\s*$"		    end="^@end titlepage\s*$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplMltlnDMAtCmd,texitplAtCmd,texitplPrmAtCmd,texitplMltlnAtCmd
syn region texitplPrmAtCmd     matchgroup=texitplAtCmd start="^@vskip "		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn match texitplAtCmd "^@exampleindent"     nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd "^@headings"	     nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd "^\\input"	     nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd "^@paragraphindent"   nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd "^@setchapternewpage" nextgroup=texitplSinglePar skipwhite


"ending a texitpl file (chap. 4 in texitpl manual)
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="@author " skip="\\$" end="$" contains=texitplSpecialChar oneline
"all below @bye should be comment TODO
syn match texitplAtCmd "^@bye\s*$"
syn match texitplAtCmd "^@contents\s*$"
syn match texitplAtCmd "^@printindex" nextgroup=texitplIndexPar skipwhite
syn match texitplAtCmd "^@setcontentsaftertitlepage\s*$"
syn match texitplAtCmd "^@setshortcontentsaftertitlepage\s*$"
syn match texitplAtCmd "^@shortcontents\s*$"
syn match texitplAtCmd "^@summarycontents\s*$"


"chapter structuring (chap. 5 in texitpl manual)
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@appendix"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@appendixsec"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@appendixsection"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@appendixsubsec"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@appendixsubsubsec"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@centerchap"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@chapheading"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@chapter"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@heading"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@majorheading"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@section"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@subheading "	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@subsection"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@subsubheading"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@subsubsection"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@subtitle"		 skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@unnumbered"		 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@unnumberedsec"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@unnumberedsubsec"	 skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@unnumberedsubsubsec" skip="\\$" end="$" contains=texitplSpecialChar oneline
syn match  texitplAtCmd "^@lowersections\s*$"
syn match  texitplAtCmd "^@raisesections\s*$"


"nodes (chap. 6 in texitpl manual)
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@anchor{"		  end="}"
syn region texitplPrmAtCmd    matchgroup=texitplAtCmd start="^@top"    skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd    matchgroup=texitplAtCmd start="^@node"   skip="\\$" end="$" contains=texitplSpecialChar oneline


"menus (chap. 7 in texitpl manual)
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@menu\s*$" end="^@end menu\s*$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplMltlnDMAtCmd


"cross references (chap. 8 in texitpl manual)
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@inforef{" end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@pxref{"   end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@ref{"     end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@uref{"    end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@xref{"    end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd


"marking words and phrases (chap. 9 in texitpl manual)
"(almost) everything appears as 'contained' too; is for tables (@table)

"this chapter is at the beginning of this file to avoid overwritings


"quotations and examples (chap. 10 in texitpl manual)
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@cartouche\s*$"	    end="^@end cartouche\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@display\s*$"	    end="^@end display\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@example\s*$"	    end="^@end example\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@flushleft\s*$"	    end="^@end flushleft\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@flushright\s*$"	    end="^@end flushright\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@format\s*$"	    end="^@end format\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@lisp\s*$"		    end="^@end lisp\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@quotation\s*$"	    end="^@end quotation\s*$"	    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@smalldisplay\s*$"     end="^@end smalldisplay\s*$"    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@smallexample\s*$"     end="^@end smallexample\s*$"    contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@smallformat\s*$"	    end="^@end smallformat\s*$"     contains=ALL
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@smalllisp\s*$"	    end="^@end smalllisp\s*$"	    contains=ALL
syn region texitplPrmAtCmd   matchgroup=texitplAtCmd start="^@exdent"	 skip="\\$" end="$"			    contains=texitplSpecialChar oneline
syn match texitplAtCmd "^@noindent\s*$"
syn match texitplAtCmd "^@smallbook\s*$"


"lists and tables (chap. 11 in texitpl manual)
syn match texitplAtCmd "@asis"		   contained
syn match texitplAtCmd "@columnfractions"  contained
syn match texitplAtCmd "@item"		   contained
syn match texitplAtCmd "@itemx"		   contained
syn match texitplAtCmd "@tab"		   contained
syn match texitplAtCmd "@headitem"	   contained
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@enumerate"  end="^@end enumerate\s*$"  contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ftable"     end="^@end ftable\s*$"     contains=ALL
syn region texitplMltlnNAtCmd matchgroup=texitplAtCmd start="^@itemize"    end="^@end itemize\s*$"    contains=ALL
syn region texitplMltlnNAtCmd matchgroup=texitplAtCmd start="^@multitable" end="^@end multitable\s*$" contains=ALL
syn region texitplMltlnNAtCmd matchgroup=texitplAtCmd start="^@table"      end="^@end table\s*$"      contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@vtable"     end="^@end vtable\s*$"     contains=ALL


"indices (chap. 12 in texitpl manual)
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@\(c\|f\|k\|p\|t\|v\)index"   skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@..index"			 skip="\\$" end="$" contains=texitplSpecialChar oneline
"@defcodeindex and @defindex is defined after chap. 15's @def* commands (otherwise those ones will overwrite these ones)
syn match texitplSIPar "\k\k\s*\k\k\s*$" contained
syn match texitplAtCmd "^@syncodeindex" nextgroup=texitplSIPar skipwhite
syn match texitplAtCmd "^@synindex"     nextgroup=texitplSIPar skipwhite

"special insertions (chap. 13 in texitpl manual)
syn match texitplSpecialChar "@\(!\|?\|@\|\s\)"
syn match texitplSpecialChar "@{"
syn match texitplSpecialChar "@}"
"accents
syn match texitplSpecialChar "@=."
syn match texitplSpecialChar "@\('\|\"\|\^\|`\)[aeiouyAEIOUY]"
syn match texitplSpecialChar "@\~[aeinouyAEINOUY]"
syn match texitplSpecialChar "@dotaccent{.}"
syn match texitplSpecialChar "@H{.}"
syn match texitplSpecialChar "@,{[cC]}"
syn match texitplSpecialChar "@AA{}"
syn match texitplSpecialChar "@aa{}"
syn match texitplSpecialChar "@L{}"
syn match texitplSpecialChar "@l{}"
syn match texitplSpecialChar "@O{}"
syn match texitplSpecialChar "@o{}"
syn match texitplSpecialChar "@ringaccent{.}"
syn match texitplSpecialChar "@tieaccent{..}"
syn match texitplSpecialChar "@u{.}"
syn match texitplSpecialChar "@ubaraccent{.}"
syn match texitplSpecialChar "@udotaccent{.}"
syn match texitplSpecialChar "@v{.}"
"ligatures
syn match texitplSpecialChar "@AE{}"
syn match texitplSpecialChar "@ae{}"
syn match texitplSpecialChar "@copyright{}"
syn match texitplSpecialChar "@bullet" contained "for tables and lists
syn match texitplSpecialChar "@bullet{}"
syn match texitplSpecialChar "@dotless{i}"
syn match texitplSpecialChar "@dotless{j}"
syn match texitplSpecialChar "@dots{}"
syn match texitplSpecialChar "@enddots{}"
syn match texitplSpecialChar "@equiv" contained "for tables and lists
syn match texitplSpecialChar "@equiv{}"
syn match texitplSpecialChar "@error{}"
syn match texitplSpecialChar "@exclamdown{}"
syn match texitplSpecialChar "@expansion{}"
syn match texitplSpecialChar "@minus" contained "for tables and lists
syn match texitplSpecialChar "@minus{}"
syn match texitplSpecialChar "@OE{}"
syn match texitplSpecialChar "@oe{}"
syn match texitplSpecialChar "@point" contained "for tables and lists
syn match texitplSpecialChar "@point{}"
syn match texitplSpecialChar "@pounds{}"
syn match texitplSpecialChar "@print{}"
syn match texitplSpecialChar "@questiondown{}"
syn match texitplSpecialChar "@result" contained "for tables and lists
syn match texitplSpecialChar "@result{}"
syn match texitplSpecialChar "@ss{}"
syn match texitplSpecialChar "@TeX{}"
"other
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@dmn{"      end="}"
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@footnote{" end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@image{"    end="}"
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@math{"     end="}"
syn match texitplAtCmd "@footnotestyle" nextgroup=texitplSinglePar skipwhite


"making and preventing breaks (chap. 14 in texitpl manual)
syn match texitplSpecialChar  "@\(\*\|-\|\.\)"
syn match texitplAtCmd	      "^@need"	   nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd	      "^@page\s*$"
syn match texitplAtCmd	      "^@sp"	   nextgroup=texitplSinglePar skipwhite
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@group\s*$"   end="^@end group\s*$" contains=ALL
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@hyphenation{" end="}"
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@w{"	    end="}"		  contains=texitplSpecialChar,texitplBrcPrmAtCmd


"definition commands (chap. 15 in texitpl manual)
syn match texitplMltlnAtCmdFLine "^@def\k\+" contained
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@def\k\+" end="^@end def\k\+$"      contains=ALL

"next 2 commands are from chap. 12; must be defined after @def* commands above to overwrite them
syn match texitplAtCmd "@defcodeindex" nextgroup=texitplIndexPar skipwhite
syn match texitplAtCmd "@defindex" nextgroup=texitplIndexPar skipwhite


"conditionally visible text (chap. 16 in texitpl manual)
syn match texitplAtCmd "^@clear" nextgroup=texitplSinglePar skipwhite
syn region texitplMltln2AtCmd matchgroup=texitplAtCmd start="^@html\s*$"	end="^@end html\s*$"
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifclear"		end="^@end ifclear\s*$"   contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifhtml"		end="^@end ifhtml\s*$"	  contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifinfo"		end="^@end ifinfo\s*$"	  contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifnothtml"	end="^@end ifnothtml\s*$" contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifnotinfo"	end="^@end ifnotinfo\s*$" contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifnottex"	end="^@end ifnottex\s*$"  contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@ifset"		end="^@end ifset\s*$"	  contains=ALL
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@iftex"		end="^@end iftex\s*$"	  contains=ALL
syn region texitplPrmAtCmd    matchgroup=texitplAtCmd start="^@set " skip="\\$" end="$" contains=texitplSpecialChar oneline
syn region texitplTexCmd			      start="\$\$"		end="\$\$" contained
syn region texitplMltlnAtCmd  matchgroup=texitplAtCmd start="^@tex"		end="^@end tex\s*$"	  contains=texitplTexCmd
syn region texitplBrcPrmAtCmd matchgroup=texitplAtCmd start="@value{"		end="}" contains=texitplSpecialChar,texitplBrcPrmAtCmd


"internationalization (chap. 17 in texitpl manual)
syn match texitplAtCmd "@documentencoding" nextgroup=texitplSinglePar skipwhite
syn match texitplAtCmd "@documentlanguage" nextgroup=texitplIndexPar skipwhite


"defining new texitpl commands (chap. 18 in texitpl manual)
syn match texitplAtCmd	"@alias"		      nextgroup=texitplAssignment skipwhite
syn match texitplDIEPar "\S*\s*,\s*\S*\s*,\s*\S*\s*$" contained
syn match texitplAtCmd	"@definfoenclose"	      nextgroup=texitplDIEPar	  skipwhite
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@macro" end="^@end macro\s*$" contains=ALL


"formatting hardcopy (chap. 19 in texitpl manual)
syn match texitplAtCmd "^@afourlatex\s*$"
syn match texitplAtCmd "^@afourpaper\s*$"
syn match texitplAtCmd "^@afourwide\s*$"
syn match texitplAtCmd "^@finalout\s*$"
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@pagesizes" end="$" oneline


"creating and installing Info Files (chap. 20 in texitpl manual)
syn region texitplPrmAtCmd   matchgroup=texitplAtCmd start="^@dircategory"  skip="\\$" end="$" oneline
syn region texitplMltlnAtCmd matchgroup=texitplAtCmd start="^@direntry\s*$"	       end="^@end direntry\s*$" contains=texitplSpecialChar
syn match  texitplAtCmd "^@novalidate\s*$"


"include files (appendix E in texitpl manual)
syn match texitplAtCmd "^@include" nextgroup=texitplSinglePar skipwhite


"page headings (appendix F in texitpl manual)
syn match texitplHFSpecialChar "@|"		  contained
syn match texitplThisAtCmd     "@thischapter"	  contained
syn match texitplThisAtCmd     "@thischaptername" contained
syn match texitplThisAtCmd     "@thisfile"	  contained
syn match texitplThisAtCmd     "@thispage"	  contained
syn match texitplThisAtCmd     "@thistitle"	  contained
syn match texitplThisAtCmd     "@today{}"	  contained
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@evenfooting"  skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@evenheading"  skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@everyfooting" skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@everyheading" skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@oddfooting"   skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline
syn region texitplPrmAtCmd matchgroup=texitplAtCmd start="^@oddheading"   skip="\\$" end="$" contains=texitplSpecialChar,texitplBrcPrmAtCmd,texitplThisAtCmd,texitplHFSpecialChar oneline


"refilling paragraphs (appendix H in texitpl manual)
syn match  texitplAtCmd "@refill"


syn cluster texitplAll contains=ALLBUT,texitplThisAtCmd,texitplHFSpecialChar
syn cluster texitplReducedAll contains=texitplSpecialChar,texitplBrcPrmAtCmd
"==============================================================================
" highlighting

" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_texitpl_syn_inits")

  if version < 508
    let did_texitpl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink texitplSpecialChar	Special
  HiLink texitplHFSpecialChar	Special

  HiLink texitplError		Error
  HiLink texitplIdent		Identifier
  HiLink texitplAssignment	Identifier
  HiLink texitplSinglePar	Identifier
  HiLink texitplIndexPar	Identifier
  HiLink texitplSIPar		Identifier
  HiLink texitplDIEPar		Identifier
  HiLink texitplTexCmd		PreProc


  HiLink texitplAtCmd		Statement	"@-command
  HiLink texitplPrmAtCmd	String		"@-command in one line with unknown nr. of parameters
						"is String because is found as a region and is 'matchgroup'-ed
						"to texitplAtCmd
  HiLink texitplBrcPrmAtCmd	String		"@-command with parameter(s) in braces ({})
						"is String because is found as a region and is 'matchgroup'-ed to texitplAtCmd
  HiLink texitplMltlnAtCmdFLine  texitplAtCmd	"repeated embedded First lines in @-commands
  HiLink texitplMltlnAtCmd	String		"@-command in multiple lines
						"is String because is found as a region and is 'matchgroup'-ed to texitplAtCmd
  HiLink texitplMltln2AtCmd	PreProc		"@-command in multiple lines (same as texitplMltlnAtCmd, just with other colors)
  HiLink texitplMltlnDMAtCmd	PreProc		"@-command in multiple lines (same as texitplMltlnAtCmd, just with other colors; used for @detailmenu, which can be included in @menu)
  HiLink texitplMltlnNAtCmd	Normal		"@-command in multiple lines (same as texitplMltlnAtCmd, just with other colors)
  HiLink texitplThisAtCmd	Statement	"@-command used in headers and footers (@this... series)

  HiLink texitplComment	Comment

  delcommand HiLink
endif


let b:current_syntax = "texitpl"

if main_syntax == 'texitpl'
  unlet main_syntax
endif

" vim: ts=8
