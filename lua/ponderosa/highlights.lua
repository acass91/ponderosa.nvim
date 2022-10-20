--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

return function(colors)
  local lush = require('lush')

  -- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
  -- support an annotation like the following. Consult your server documentation.
  ---@diagnostic disable: undefined-global
  return lush(function(injected_functions)
    -- functions are injected via a table for future expansion
    -- you probably want to alias it locally
    local sym = injected_functions.sym
    local TreeWarning = sym("@text.warning") or TSWarning
    local TreeDanger = sym("@text.danger") or TSDanger
    local TreeConstructor = sym("@constructor") or TSConstructor
    local TreeField = sym("@field") or TSField
    local TreeKeyword = sym("@keyword") or TSKeyword
    local TreeKeywordFunction = sym("@keyword.function") or TSKeywordFunction
    local TreeLabel = sym("@label") or TSLabel
    local TreeOperator = sym("@operator") or TSOperator
    local TreeParameter = sym("@parameter") or TSParameter
    local TreeProperty = sym("@property") or TSProperty
    local TreePunctDelimiter = sym("@punctuation.delimiter") or TSPunctDelimiter
    local TreePunctBracket = sym("@punctuation.bracket") or TSPunctBracker
    local TreePunctSpecial = sym("@punctuation.special") or TSPunctSpecial
    local TreeStringRegex = sym("@string.regex") or TSStringRegex
    local TreeStringEscape = sym("@string.escape") or TSStringEscape
    local TreeVariable = sym("@variable") or TSVariable
    local TreeVariableBuiltin = sym("@variable.builtin") or TSVariableBuiltin
    local TreeTextReference = sym("@text.reference") or TSTextReference

    return {
      -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
      -- groups, mostly used for styling UI elements.
      -- Comment them out and add your own properties to override the defaults.
      -- An empty definition `{}` will clear all styling, leaving elements looking
      -- like the 'Normal' group.
      -- To be able to link to a group, it must already be defined, so you may have
      -- to reorder items as you go.
      --
      -- See :h highlight-groups
      --
      Normal { bg = colors.bg, fg = colors.fg }, -- normal text
      NormalNC     { bg = colors.dark_bg }, -- normal text in non-current windows
      ColorColumn  { bg = colors.dark_bg }, -- Columns set with 'colorcolumn'
      Conceal      { fg = colors.fg5}, -- Placeholder characters substituted for concealed text (see 'conceallevel')
      Cursor       { bg = colors.fg, fg = colors.bg}, -- Character under the cursor
      lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
      CursorIM     { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
      CursorLine   { bg = colors.bg2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
      Directory    { fg = colors.accent9 }, -- Directory names (and other special names in listings)
      DiffAdd      { bg = colors.accent3.mix(colors.bg, 70), fg = colors.moss}, -- Diff mode: Added line |diff.txt|
      DiffChange   { bg = colors.accent5.mix(colors.bg, 70), fg = colors.autumn}, -- Diff mode: Changed line |diff.txt|
      DiffDelete   { bg = colors.accent7.mix(colors.bg, 70), fg = colors.paintbrush}, -- Diff mode: Deleted line |diff.txt|
      DiffText     { Normal }, -- Diff mode: Changed text within a changed line |diff.txt|
      EndOfBuffer  { fg = colors.bg }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
      TermCursor   { Cursor }, -- Cursor in a focused terminal
      TermCursorNC { bg = colors.fg5 }, -- Cursor in an unfocused terminal
      ErrorMsg     { fg = colors.accent7 }, -- Error messages on the command line
      VertSplit    { fg = colors.fg5, bg = NormalNC.bg}, -- Column separating vertically split windows
      Folded       { bg = colors.bg3, fg = colors.fg3}, -- Line used for closed folds
      FoldColumn   { Normal }, -- 'foldcolumn'
      LineNr       { fg = colors.fg4, bg = colors.dark_bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      SignColumn   { LineNr }, -- Column where |signs| are displayed
      IncSearch    { Cursor }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      Substitute   { IncSearch }, -- |:substitute| replacement text highlighting
      CursorLineNr { LineNr }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      MatchParen   { IncSearch }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      ModeMsg      { fg = colors.fg3 }, -- 'showmode' message (e.g., "-- INSERT -- ")
      MsgArea      { Normal }, -- Area for messages and cmdline
      MsgSeparator { VertSplit }, -- Separator for scrolled messages, `msgsep` flag of 'display'
      MoreMsg      { fg = colors.accent5 }, -- |more-prompt|
      NonText      { Conceal }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
      NormalFloat  { bg = colors.bg4 }, -- Normal text in floating windows.
      Pmenu        { bg = colors.bg4, fg = colors.fg3 }, -- Popup menu: Normal item.
      PmenuSel     { bg = colors.fg5 }, -- Popup menu: Selected item.
      PmenuSbar    { bg = colors.bg3 }, -- Popup menu: Scrollbar.
      PmenuThumb   { bg = colors.fg5}, -- Popup menu: Thumb of the scrollbar.
      Question     { fg = colors.accent5 }, -- |hit-enter| prompt and yes/no questions
      QuickFixLine { Normal }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      Search       { bg = colors.bg4, fg = colors.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
      SpecialKey   { fg = colors.accent5 }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
      SpellBad     { fg = colors.accent7 }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellCap     { fg = colors.accent6 }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellLocal   { fg = colors.accent6 }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
      SpellRare    { fg = colors.accent6 }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
      StatusLine   { bg = colors.bg4, fg = colors.fg2}, -- Status line of current window
      StatusLineNC { bg = colors.bg3, fg = colors.fg3}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
      TabLine      { bg = StatusLine.bg, fg = colors.fg3}, -- Tab pages line, not active tab page label
      TabLineFill  { TabLine }, -- Tab pages line, where there are no labels
      TabLineSel   { bg = colors.bg2, fg = colors.fg2 }, -- Tab pages line, active tab page label
      Title        { fg = colors.accent5 }, -- Titles for output from ":set all", ":autocmd" etc.
      Visual       {bg = colors.bg4 }, -- Visual mode selection
      VisualNOS    { bg = colors.bg3}, -- Visual mode selection when vim is "Not Owning the Selection".
      WarningMsg   { ErrorMsg }, -- Warning messages
      Whitespace   {fg = colors.fg5 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Winseparator { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
      WildMenu     { PmenuSel}, -- Current match in 'wildmenu' completion

      -- Common vim syntax groups used for all kinds of code and markup.
      -- Commented-out groups should chain up to their preferred (*) group
      -- by default.
      --
      -- See :h group-name
      --
      -- Uncomment and edit if you want more specific syntax highlighting.

      Comment        { fg = colors.fg4 }, -- Any comment

      Constant       { fg = colors.accent10 }, -- (*) Any constant
      String         { fg = colors.accent12 }, --   A string constant: "this is a string"
      Character      { fg = String.fg.lighten(15) }, --   A character constant: 'c', '\n'
      Number         { fg = colors.accent6 }, --   A number constant: 234, 0xff
      Boolean        { fg = colors.accent9 }, --   A boolean constant: TRUE, false
      Float          { Number }, --   A floating point constant: 2.3e10

      Identifier     { fg = colors.accent1 }, -- (*) Any variable name
      Function       { fg = colors.accent10 }, --   Function name (also: methods for classes)

      Statement      { fg = colors.accent2 }, -- (*) Any statement
      Conditional    { Statement }, --   if, then, else, endif, switch, etc.
      Repeat         { Statement }, --   for, do, while, etc.
      Label          { Statement }, --   case, default, etc.
      Operator       { Statement }, --   "sizeof", "+", "*", etc.
      Keyword        { Statement }, --   any other keyword
      Exception      { Statement }, --   try, catch, throw

      PreProc        { fg = colors.accent4 }, -- (*) Generic Preprocessor
      Include        { fg = colors.accent4 }, --   Preprocessor #include
      Define         { fg = colors.accent4 }, --   Preprocessor #define
      Macro          { fg = colors.accent4 }, --   Same as Define
      PreCondit      { fg = colors.accent4 }, --   Preprocessor #if, #else, #endif, etc.

      Type           { fg = colors.accent2}, -- (*) int, long, char, etc.
      StorageClass   { Type }, --   static, register, volatile, etc.
      Structure      { Type }, --   struct, union, enum, etc.
      Typedef        { Type }, --   A typedef

      Special        { fg = colors.accent11}, -- (*) Any special symbol
      SpecialChar    { Special }, --   Special character in a constant
      -- Tag            { }, --   You can use CTRL-] on this
      -- Delimiter      { }, --   Character that needs attention
      -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
      -- Debug          { }, --   Debugging statements

      Underlined     { gui = "underline", fg = colors.fg3 }, -- Text that stands out, HTML links
      Ignore         { fg = colors.fg5 }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
      Error          { fg = colors.accent7 }, -- Any erroneous construct
      Todo           { fg = colors.accent6 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

      -- These groups are for the native LSP client and diagnostic system. Some
      -- other LSP clients may use these groups, or use their own. Consult your
      -- LSP client's documentation.

      -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
      --
      LspReferenceText            { bg = colors.bg3} , -- Used for highlighting "text" references
      LspReferenceRead            { LspReferenceText} , -- Used for highlighting "read" references
      LspReferenceWrite           { LspReferenceText} , -- Used for highlighting "write" references
      LspCodeLens                 { bg = colors.bg2} , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
      LspCodeLensSeparator        { fg = colors.fg5} , -- Used to color the seperator between two or more code lens.
      LspSignatureActiveParameter { bg = colors.bg4} , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

      -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
      --
      DiagnosticError            { fg = colors.accent7} , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticWarn             { fg = colors.accent6 } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticInfo             { fg = colors.accent10} , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticHint             { fg = colors.accent8} , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticVirtualTextError { fg = DiagnosticError.fg, bg = colors.bg3} , -- Used for "Error" diagnostic virtual text.
      DiagnosticVirtualTextWarn  { fg = DiagnosticWarn.fg, bg = colors.bg3} , -- Used for "Warn" diagnostic virtual text.
      DiagnosticVirtualTextInfo  { fg = DiagnosticInfo.fg, bg = colors.bg3} , -- Used for "Info" diagnostic virtual text.
      DiagnosticVirtualTextHint  { fg = DiagnosticHint.fg, bg = colors.bg3} , -- Used for "Hint" diagnostic virtual text.
      DiagnosticUnderlineError   { gui = "underline"} , -- Used to underline "Error" diagnostics.
      DiagnosticUnderlineWarn    { gui = "underline"} , -- Used to underline "Warn" diagnostics.
      DiagnosticUnderlineInfo    { gui = "underline"} , -- Used to underline "Info" diagnostics.
      DiagnosticUnderlineHint    { gui = "underline"} , -- Used to underline "Hint" diagnostics.
      DiagnosticFloatingError    { fg = DiagnosticError.fg, bg = colors.bg4} , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
      DiagnosticFloatingWarn     { fg = DiagnosticWarn.fg, bg = colors.bg4} , -- Used to color "Warn" diagnostic messages in diagnostics float.
      DiagnosticFloatingInfo     { fg = DiagnosticInfo.fg, bg = colors.bg4} , -- Used to color "Info" diagnostic messages in diagnostics float.
      DiagnosticFloatingHint     { fg = DiagnosticHint.fg, bg = colors.bg4} , -- Used to color "Hint" diagnostic messages in diagnostics float.
      DiagnosticSignError        { fg = DiagnosticError.fg, bg = LineNr.bg} , -- Used for "Error" signs in sign column.
      DiagnosticSignWarn         { fg = DiagnosticWarn.fg, bg = LineNr.bg} , -- Used for "Warn" signs in sign column.
      DiagnosticSignInfo         { fg = DiagnosticInfo.fg, bg = LineNr.bg} , -- Used for "Info" signs in sign column.
      DiagnosticSignHint         { fg = DiagnosticHint.fg, bg = LineNr.bg} , -- Used for "Hint" signs in sign column.

      -- Tree-Sitter syntax groups. Most link to corresponding
      -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
      --
      -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
      --
      TSAttribute          { fg = colors.accent5 } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
      TSBoolean            { Boolean } , -- Boolean literals: `True` and `False` in Python.
      TSCharacter          { Character } , -- Character literals: `'a'` in C.
      TSCharacterSpecial   { Character } , -- Special characters.
      TSComment            { Comment } , -- Line comments and block comments.
      TSConditional        { Conditional } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
      TSConstant           { Constant } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
      TSConstBuiltin       { Constant } , -- Built-in constant values: `nil` in Lua.
      TSConstMacro         { Constant } , -- Constants defined by macros: `NULL` in C.
      TreeConstructor  { Function } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
      TSDebug              { fg = colors.accent5 } , -- Debugging statements.
      TSDefine             { PreProc } , -- Preprocessor #define statements.
      TSError              { Error } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
      TSException          { Exception } , -- Exception related keywords: `try`, `except`, `finally` in Python.
      TreeField        { fg = colors.fg} , -- Object and struct fields.
      TSFloat              { Number } , -- Floating-point number literals.
      TSFunction           { Function } , -- Function calls and definitions.
      TSFuncBuiltin        { Function } , -- Built-in functions: `print` in Lua.
      TSFuncMacro          { Function } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
      TSInclude            { Function } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
      TreeKeyword      { Keyword } , -- Keywords that don't fit into other categories.
      TreeKeywordFunction    { fg = colors.accent7} , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
      TSKeywordOperator    { fg = colors.accent5 } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
      TSKeywordReturn      { fg = colors.accent7 } , -- Keywords like `return` and `yield`.
      TreeLabel        { Label } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
      TSMethod             { Function } , -- Method calls and definitions.
      TSNamespace          { Type } , -- Identifiers referring to modules and namespaces.
      -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
      TSNumber             { Number } , -- Numeric literals that don't fit into other categories.
      TreeOperator     { Operator } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
      TreeParameter    { fg = colors.fg } , -- Parameters of a function.
      TSParameterReference { fg = colors.fg } , -- References to parameters of a function.
      TSPreProc            { PreProc } , -- Preprocessor #if, #else, #endif, etc.
      TreeProperty           { fg = colors.fg } , -- Same as `TSField`.
      TreePunctDelimiter  { Operator } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
      TreePunctBracket       { Operator } , -- Brackets, braces, parentheses, etc.
      TreePunctSpecial       { Operator } , -- Special punctuation that doesn't fit into the previous categories.
      TSRepeat             { Repeat } , -- Keywords related to loops: `for`, `while`, etc.
      TSStorageClass       { StorageClass } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
      TSString             { String } , -- String literals.
      TreeStringRegex        { Character } , -- Regular expression literals.
      TreeStringEscape       { Character } , -- Escape characters within a string: `\n`, `\t`, etc.
      TSStringSpecial      { Character } , -- Strings with special meaning that don't fit into the previous categories.
      TSSymbol             { Character } , -- Identifiers referring to symbols or atoms.
      TSTag                { Keyword } , -- Tags like HTML tag names.
      TSTagAttribute       { Function } , -- HTML tag attributes.
      TSTagDelimiter       { Operator } , -- Tag delimiters like `<` `>` `/`.
      TSText               { Normal} , -- Non-structured text. Like text in a markup language.
      TSStrong             { gui = "bold"} , -- Text to be represented in bold.
      TSEmphasis           { gui = "italic"} , -- Text to be represented with emphasis.
      TSUnderline          { gui = "underline"} , -- Text to be represented with an underline.
      TSStrike             { gui = "strikethrough" } , -- Strikethrough text.
      TSTitle              { fg = colors.accent5} , -- Text that is part of a title.
      TSLiteral            { fg = Character.fg} , -- Literal or verbatim text.
      TSURI                { fg = colors.fg3} , -- URIs like hyperlinks or email addresses.
      TSMath               { fg = colors.accent5 } , -- Math environments like LaTeX's `$ ... $`
      TreeTextReference      { fg = colors.accent8 } , -- Footnotes, text references, citations, etc.
      TSEnvironment        { fg = colors.accent5} , -- Text environments of markup languages.
      TSEnvironmentName    { TSEnvironment } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
      TSNote               { fg = colors.accent2 } , -- Text representation of an informational note.
      TreeWarning            { fg = colors.accent5 } , -- Text representation of a warning note.
      TreeDanger             { fg = colors.accent7 } , -- Text representation of a danger note.
      TSType               { Type } , -- Type (and class) definitions and annotations.
      TSTypeBuiltin        { Type } , -- Built-in types: `i32` in Rust.
      TreeVariable           { Identifier } , -- Variable names that don't fit into other categories.
      TreeVariableBuiltin    { fg = colors.accent5 } , -- Variable names defined by the language: `this` or `self` in Javascript.
    }
  end)
end

-- vi:nowrap
