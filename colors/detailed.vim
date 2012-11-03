" So many 256-color schemes merely shift the palette around, displaying only 8
" colors (even though they're a *different* set of 8 colors than default).
"
" This scheme is more detailed than that.
"
" The idea is that your eyes will learn to pick up on subtler patterns without
" requiring as much from your conscious mind. (And, I've found, it does work).
" Instead of the goal being merely looking cool, the goal is to maximize info
" bandwidth from the computer to the brain.
"
" Note that some small effort was taken to be similar to the default vim
" syntax highlighting where it makes sense. That is, "def" is magenta in the
" default, so vim-detailed makes it a shade of purple (and uses different
" shades for all the other magenta things from the default colorscheme).
"
" Companions to this file are:
" Indent Guides: https://github.com/nathanaelkane/vim-indent-guides
"
" TODO
" ----
"
"   - More languages, other than Ruby. (Contributions will be very welcome)
"   - Sync pry-theme to this
"   - Finish s:make_obvious() fillings-in
"   - GUI colors
"     Perhaps redo with:
"     http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   - Distinguish between bare things versus contained things:
"    -  class Foo < Bar is:
"       ['rubyBlock','rubyClassDeclaration', 'rubyConstant'] and
"       ['rubyBlock', 'rubyConstant']'
"
"    -  class Foo
"         class_call # ['rubyBlock', 'rubyBlock', 'rubyLocalVariableOrMethod']
"       end
"       toplevel_stuff ['rubyBlock', 'rubyLocalVariableOrMethod']'
"
"       "osse │ rking: maybe make a new syntax rule where you fiddle with the
"         'contains' argument to :syn"

let colors_name = 'detailed'

" It would be rather hard to make this work on both black and white. If you're
" a big fan of white bg's, let me know, and we can collaborate on a solution.
set bg=dark

" Prevent any screwy setting from causing errors:
let s:save_cpo = &cpo | set cpo&vim

" If you don't have this, rails.vim will zap the matchers when it resets
" syntax for its own additions:
au Syntax * call s:fatpacked_rainbow_parens()

au Syntax ruby call s:detailed_syntax_addtions()

" Show detailed syntax stack
nmap <Leader>dets :call <SID>SynStack()<CR>
fun! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun

" Color Palette {{{
let s:c = {
  \'basic8_red (TODO: use this)': 1,
  \'basic8_green': 2,
  \'basic8_yellow (TODO: use this)': 3,
  \'basic8_blue (TODO: use this)': 4,
  \'basic8_magenta': 5,
  \'basic8_cyan': 6,
  \'red52': 52,
  \'red88': 88,
  \'red124': 124,
  \'red160': 160,
  \'red196 (TODO: use this)': 196,
  \'yellow58 (TODO: use this)': 58,
  \'yellow100': 100,
  \'yellow136 (TODO: use this)': 136,
  \'yellow142 (TODO: use this)': 142,
  \'yellow148': 148,
  \'yellow149': 149,
  \'yellow178': 178,
  \'yellow190': 190,
  \'yellow220 (TODO: use this)': 220,
  \'orange208': 208,
  \'light_yellow230': 229,
  \'graygreen (TODO: use this)': 23,
  \'green34': 34,
  \'green71': 71,
  \'green76 (TODO: use this)': 76,
  \'green84': 84,
  \'seafoam': 30,
  \'seafoam2 (TODO: use this)': 35,
  \'teal50': 50,
  \'blue19 (TODO: use this)': 19,
  \'blue20 (TODO: use this)': 20,
  \'blue21 (TODO: use this)': 21,
  \'blue25': 25,
  \'blue75': 75,
  \'blue87': 87,
  \'lavender104': 104,
  \'purple53': 53,
  \'purple89 (TODO: use this)': 89,
  \'purple90': 90,
  \'purple95 (TODO: use this)': 95,
  \'purple99 (TODO: use this)': 79,
  \'purple125': 125,
  \'purple126': 126,
  \'purple127 (TODO: use this)': 127,
  \'purple129 (TODO: use this)': 129,
  \'purple131': 131,
  \'purple141 (TODO: use this)': 141,
  \'purple161 (TODO: use this)': 161,
  \'purple201': 201,
  \'purple225': 225,
  \'gray16': 16,
  \'gray232': 232,
  \'gray233': 233,
  \'gray234': 234,
  \'gray235': 235,
  \'gray236': 236,
  \'gray237': 237,
  \'gray238': 238,
  \'gray239': 239,
  \'gray240': 240,
  \'gray241': 241,
  \'gray242': 242,
  \'gray243': 243,
  \'gray244': 244,
  \'gray245': 245,
  \'gray246': 246,
  \'gray247': 247,
  \'gray248': 248,
  \'gray249': 249,
  \'gray250': 250,
  \'gray251': 251,
  \'gray252': 252,
  \'gray253': 253,
  \'gray254': 254,
  \'gray255': 255,
  \}
" }}}

" :hi funcs {{{
fun! s:fg(group, fg)
  exe 'hi '.a:group.' ctermfg='.s:c[a:fg]
endfun

fun! s:fgbg(group, fg, bg)
  exe 'hi '.a:group.' ctermfg='.s:c[a:fg].' ctermbg='.s:c[a:bg]
endfun

fun! s:bold_fg(group, fg)
  exe 'hi '.a:group.' ctermfg='.s:c[a:fg].' cterm=bold'
endfun

fun! s:make_obvious(group)
  call s:fgbg(a:group, 'green84', 'red160')
endfun
" }}}

" https://github.com/bitc/vim-bad-whitespace
hi BadWhitespace  ctermbg=58

" Basic/Default-like Palette {{{
hi SpecialKey     term=bold ctermfg=81 guifg=Cyan
hi NonText        term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory      term=bold ctermfg=159 guifg=Cyan
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse gui=reverse
hi Search         term=reverse ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi MoreMsg        term=bold ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg        term=bold cterm=bold gui=bold
hi LineNr         term=underline ctermfg=11 guifg=Yellow
hi CursorLineNr   term=bold ctermfg=11 gui=bold guifg=Yellow
hi Question       term=standout ctermfg=121 gui=bold guifg=Green
hi StatusLine     term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse gui=reverse
hi VertSplit      term=reverse cterm=reverse gui=reverse
hi Title          term=bold ctermfg=225 gui=bold guifg=Magenta
hi Visual         term=reverse ctermbg=242 guibg=DarkGrey
hi VisualNOS      term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg     term=standout ctermfg=224 guifg=Red
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded         term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=DarkGrey
hi FoldColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi DiffAdd        term=bold ctermbg=4 guibg=DarkBlue
hi DiffChange     term=bold ctermbg=5 guibg=DarkMagenta
hi DiffDelete     term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
hi DiffText       term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn     term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       term=reverse ctermbg=9 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=12 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=Cyan
hi Pmenu          ctermfg=0 ctermbg=13 guibg=Magenta
hi PmenuSel       ctermfg=0 ctermbg=242 guibg=DarkGrey
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=15 guibg=White
hi TabLine        term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=242 guibg=Grey40
hi CursorLine     term=underline cterm=underline guibg=Grey40
hi ColorColumn    term=reverse ctermfg=9 ctermbg=12 guifg=black guibg=lightgrey
hi MatchParen     term=reverse ctermbg=6 guibg=DarkCyan
hi Comment        term=bold ctermfg=14 guifg=#80a0ff
hi Constant       term=underline ctermfg=13 guifg=#ffa0a0
hi Special        term=bold ctermfg=224 guifg=Orange
hi Identifier     term=underline cterm=bold ctermfg=14 guifg=#40ffff
hi Statement      term=bold ctermfg=11 gui=bold guifg=#ffff60
hi PreProc        term=underline ctermfg=81 guifg=#ff80ff
hi Type           term=underline ctermfg=121 gui=bold guifg=#60ff60
hi Underlined     term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore         ctermfg=0 guifg=bg
hi Error          term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo           term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
" }}}

" Default links {{{
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
hi link mailQuoted1     Type
hi link GPGWarning      WarningMsg
hi link GPGError        ErrorMsg
hi link GPGHighlightUnknownRecipient  ErrorMsg
hi link rubyConditional  Conditional
hi link rubyExceptional  rubyConditional
hi link rubyMethodExceptional  rubyDefine
hi link rubyTodo        Todo
hi link rubyStringEscape  Special
hi link rubyQuoteEscape  rubyStringEscape
" hi rubyInterpolation cleared
hi link rubyGlobalVariable  rubyIdentifier
hi link rubyPredefinedVariable  rubyPredefinedIdentifier " Hrm?
hi link rubyInvalidVariable  Error
hi link rubyNoInterpolation  rubyString
hi link rubyFunction    Function
hi link rubyException   Exception
hi link rubyKeyword     Keyword
hi link rubyPredefinedIdentifier  rubyIdentifier
"}}}

" s:detailed_colors — the good stuff {{{
fun! s:detailed_colors()
  "* `fail`/`raise` are default yellow but more a warny orange.
  call s:fg('Exception', 'orange208')
  "* class `@@vars` get ugly, cautionary color: they are troublesome.
  call s:fgbg('rubyClassVariable', 'blue75', 'red52')

  call s:fg('rubyConstant', 'green34')

  call s:bold_fg('rubyClass', 'purple126')
  call s:fg('rubyModule', 'purple126')
  call s:fg('rubyDefine', 'basic8_magenta')
  call s:fg('rubyInclude', 'purple53')

  call s:fg('rubyMethodBlock', 'gray250') " Contents of methods, basically
  call s:fg('rubyDoBlock', 'light_yellow230')
  call s:fg('rubyBlock', 'purple225')
  call s:fg('rubyInstanceVariable', 'blue75')

  "TODO: call s:fg('rubyDelimEscape', '')
  call s:fg('rubyString', 'red88')
  call s:fg('rubyInterpolationDelimiter', 'gray244')

  call s:fg('rubyRegexpSpecial', 'seafoam')
  call s:fg('rubyRegexpComment', 'gray238')

  " call s:make_obvious('rubyRegexpParens')
  " call s:make_obvious('rubyRegexpBrackets')

  call s:fg('rubyRegexpCharClass', 'basic8_green')
  call s:fg('rubyRegexpQuantifier', 'yellow148')
  call s:bold_fg('rubyRegexpEscape', 'purple90')
  call s:fg('rubyRegexpAnchor', 'purple90')
  call s:fg('rubyRegexpDot', 'green34')
  call s:bold_fg('rubyRegexpDelimiter', 'red88')
  call s:fg('rubyRegexp', 'red160')
  call s:fg('rubyASCIICode', 'green71')

  call s:fg('rubyPseudoVariable', 'purple125')
  call s:fg('rubyInteger', 'red124')
  call s:fg('rubyFloat', 'red160')

  call s:fg('rubyBlockArgument', 'blue87')
  call s:fg('rubySymbol', 'lavender104')
  call s:bold_fg('rubyBlockParameter', 'basic8_cyan')
  call s:fg('rubyBlockParameterList', 'blue25')
  hi link rubyPredefinedConstant  rubyPredefinedIdentifier " TODO
  hi link rubyStringDelimiter  Delimiter " TODO
  hi link rubySymbolDelimiter  rubyStringDelimiter " TODO
  " call s:make_obvious('rubyHeredocStart')
  " call s:make_obvious('rubyAliasDeclaration2')
  " call s:make_obvious('rubyAliasDeclaration')
  call s:fg('rubyBoolean', 'purple131')
  " hi rubyMethodDeclaration cleared
  hi link rubyOperator    Operator " TODO
  hi link rubyPseudoOperator  rubyOperator " -= /= **= *= etc
  " call s:make_obvious('rubyClassDeclaration')
  " call s:make_obvious('rubyModuleDeclaration')
  hi link rubyControl     Statement " TODO
  hi link rubyBeginEnd    Statement " TODO
  call s:fg('rubyAccess', 'yellow100')
  call s:fg('rubyAttribute', 'yellow178')
  call s:fg('rubyEval', 'yellow190')
  call s:bold_fg('rubyConditionalModifier', 'yellow148') " 'Yoda if'
  call s:bold_fg('rubyRepeatModifier', 'yellow149') " …while/until
  " hi rubyConditionalExpression cleared
  call s:fg('rubyRepeat', 'yellow178')
  " TODO: call s:make_obvious('rubyOptionalDo')
  " TODO: call s:make_obvious('rubyOptionalDoLine')
  " hi rubyRepeatExpression cleared
  call s:fg('rubySharpBang', 'gray238')
  hi link rubySpaceError  rubyError
  call s:fg('rubyComment', 'gray241')
  " hi rubyMultilineComment cleared
  hi link rubyDocumentation  Comment
  " hi rubyKeywordAsMethod cleared
  call s:fg('rubyDataDirective', 'purple201')
  call s:fg('rubyData', 'gray245')

  " rails.vim niceness:
  call s:fg('rubyRailsARAssociationMethod', 'teal50')

  " detailed.vim especialties:
  call s:fg('rubyInitialize', 'green84')

  " Only linked highlights, not actual syntax:
  " call s:make_obvious('rubyIdentifier')
  " call s:make_obvious('rubyError')

  " Pretty much just the leftover default:
  " call s:make_obvious('rubyLocalVariableOrMethod')

  " Gets all [{()}] within any {}'s. Not very useful AFAICT:
  " call s:make_obvious('rubyCurlyBlock')

  " These mess up on first ] of [a[1]]. Seems plain busted.
  " call s:make_obvious('rubyArrayDelimiter')
  " call s:make_obvious('rubyArrayLiteral')

  " TODO Figure out how to get these to show up:
  " TODO call s:make_obvious('rubyBlockExpression')
  " TODO call s:make_obvious('rubyCaseExpression')

  " A mere implementation detail, AFAICT:
  " call s:make_obvious('rubyNestedParentheses')
  " call s:make_obvious('rubyNestedCurlyBraces')
  " call s:make_obvious('rubyNestedAngleBrackets')
  " call s:make_obvious('rubyNestedSquareBrackets')
endfun
" }}}

fun! s:detailed_syntax_addtions()
  call s:detailed_colors()

  " Bonus!
  syn match rubyInitialize '\<initialize\>' contained containedin=rubyMethodDeclaration

  " Fixes since syntax/ruby.vim declares these 'transparent':
  syn match rubyBlockArgument "&[_[:lower:]][_[:alnum:]]" contains=NONE display

  " TODO: # encoding: utf-8
  " TODO: Distinguish TODO / FIXME / XXX
endfun
call s:detailed_syntax_addtions()

" Rainbow-Parens Improved {{{
" Inlined from v2.3 of http://www.vim.org/scripts/script.php?script_id=4176
" 1. to remove the external dep, 2. to work around vim-rails resetting it.
" Thanks!
fun! s:fatpacked_rainbow_parens()
  let guifgs = exists('g:rainbow_guifgs')? g:rainbow_guifgs : [
        \ 'DarkOrchid3', 'RoyalBlue3', 'SeaGreen3',
        \ 'DarkOrange3', 'FireBrick',
        \ ]

  let ctermfgs = exists('g:rainbow_ctermfgs')? g:rainbow_ctermfgs : [
        \ 'darkgray', 'Darkblue', 'darkmagenta',
        \ 'darkcyan', 'darkred', 'darkgreen',
        \ ]

  let max = has('gui_running')? len(guifgs) : len(ctermfgs)

  let cmd = 'syn region %s matchgroup=%s start=/%s/ end=/%s/ containedin=%s contains=%s'
  let str = 'TOP'
  for each in range(1, max)
    let str .= ',lv'.each
  endfor
  for [left , right] in [['(',')'],['\[','\]'],['{','}']]
    for each in range(1, max - 1)
      exe printf(cmd, 'lv'.each, 'lv'.each.'c', left, right, 'lv'.(each+1) , str)
    endfor
    exe printf(cmd, 'lv'.max, 'lv'.max.'c', left, right, 'lv1' , str)
  endfor

  for id in range(1 , max)
    let ctermfg = ctermfgs[(max - id) % len(ctermfgs)]
    let guifg = guifgs[(max - id) % len(guifgs)]
    exe 'hi default lv'.id.'c ctermfg='.ctermfg.' guifg='.guifg
  endfor
endfun
" }}}

let &cpo = s:save_cpo

" vim:foldmethod=marker
