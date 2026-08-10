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

-- An Acme-inspired colorscheme for use with Lush.
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

local lush = require('lush')
local hsl = lush.hsl

-- Acme's original UI palette.
local acme_bg = hsl("#FFFFEA")
local acme_fg = hsl("#000000")
local acme_selection = hsl("#EDEB9C")
local acme_tag_bg = hsl("#EEFEFF")
local acme_tag_selection = hsl("#7B7DC1")
local acme_tag_border = hsl("#7B7DC1")
local acme_modified = hsl("#000099")
local acme_red = hsl("#AC615A")
local acme_green = hsl("#628554")

-- The Acme border colour is too pale for small foreground text on the text
-- background, so use a darker olive for secondary text such as line numbers.
local acme_muted = hsl("#8F8E4B")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    ---------------------------------------------------------------------------
    -- Acme editor UI
    ---------------------------------------------------------------------------

    Normal         { bg = acme_bg, fg = acme_fg },
    NormalNC       { Normal },
    NormalFloat    { bg = acme_bg, fg = acme_fg },
    FloatBorder    { bg = acme_bg, fg = acme_tag_border },
    FloatTitle     { bg = acme_tag_selection, fg = acme_fg, gui = "bold" },

    Cursor         { bg = acme_fg, fg = acme_bg },
    lCursor        { Cursor },
    CursorIM       { Cursor },
    TermCursor     { Cursor },
    CursorColumn   { bg = acme_bg },
    CursorLine     { bg = acme_bg },
    ColorColumn    { bg = acme_selection },

    Visual         { bg = acme_selection, fg = acme_fg },
    VisualNOS      { Visual },
    Search         { bg = acme_selection, fg = acme_fg },
    CurSearch      { bg = acme_tag_selection, fg = acme_fg },
    IncSearch      { CurSearch },
    Substitute     { CurSearch },
    MatchParen     { bg = acme_selection, fg = acme_fg, gui = "bold" },

    LineNr         { bg = acme_bg, fg = acme_muted },
    LineNrAbove    { LineNr },
    LineNrBelow    { LineNr },
    CursorLineNr   { bg = acme_bg, fg = acme_fg, gui = "bold" },
    SignColumn     { bg = acme_bg, fg = acme_fg },
    FoldColumn     { bg = acme_bg, fg = acme_muted },
    Folded         { bg = acme_selection, fg = acme_fg },
    EndOfBuffer    { bg = acme_bg, fg = acme_bg },

    NonText        { bg = acme_bg, fg = acme_muted },
    SpecialKey     { bg = acme_bg, fg = acme_muted },
    Whitespace     { bg = acme_bg, fg = acme_muted },
    Conceal        { bg = acme_bg, fg = acme_muted },
    Directory      { Normal },

    WinSeparator   { bg = acme_bg, fg = acme_tag_border },
    VertSplit      { WinSeparator },

    -- Acme's tag palette becomes Neovim's bars and menus.
    StatusLine     { bg = acme_tag_bg, fg = acme_fg, gui = "bold" },
    StatusLineNC   { bg = acme_tag_bg, fg = acme_tag_border },
    WinBar         { bg = acme_tag_bg, fg = acme_fg, gui = "bold" },
    WinBarNC       { bg = acme_tag_bg, fg = acme_tag_border },
    TabLine        { bg = acme_tag_bg, fg = acme_fg },
    TabLineSel     { bg = acme_tag_selection, fg = acme_fg, gui = "bold" },
    TabLineFill    { bg = acme_tag_bg, fg = acme_tag_border },

    Pmenu          { bg = acme_tag_bg, fg = acme_fg },
    PmenuSel       { bg = acme_tag_selection, fg = acme_fg },
    PmenuKind      { Pmenu },
    PmenuKindSel   { PmenuSel },
    PmenuExtra     { bg = acme_tag_bg, fg = acme_muted },
    PmenuExtraSel  { PmenuSel },
    PmenuSbar      { bg = acme_tag_bg },
    PmenuThumb     { bg = acme_tag_border },
    WildMenu       { PmenuSel },

    QuickFixLine   { bg = acme_tag_selection, fg = acme_fg },
    ModeMsg        { bg = acme_bg, fg = acme_fg, gui = "bold" },
    MsgArea        { Normal },
    MsgSeparator   { bg = acme_tag_bg, fg = acme_tag_border },
    MoreMsg        { bg = acme_bg, fg = acme_green },
    Question       { bg = acme_bg, fg = acme_modified },
    ErrorMsg       { bg = acme_bg, fg = acme_red },
    WarningMsg     { bg = acme_bg, fg = acme_muted },

    SpellBad       { sp = acme_red, gui = "undercurl" },
    SpellCap       { sp = acme_modified, gui = "undercurl" },
    SpellLocal     { sp = acme_green, gui = "undercurl" },
    SpellRare      { sp = acme_muted, gui = "undercurl" },

    ---------------------------------------------------------------------------
    -- Acme deliberately has no syntax colouring
    ---------------------------------------------------------------------------

    Comment        { Normal },
    Constant       { Normal },
    String         { Normal },
    Character      { Normal },
    Number         { Normal },
    Boolean        { Normal },
    Float          { Normal },
    Identifier     { Normal },
    Function       { Normal },
    Statement      { Normal },
    Conditional    { Normal },
    Repeat         { Normal },
    Label          { Normal },
    Operator       { Normal },
    Keyword        { Normal },
    Exception      { Normal },
    PreProc        { Normal },
    Include        { Normal },
    Define         { Normal },
    Macro          { Normal },
    PreCondit      { Normal },
    Type           { Normal },
    StorageClass   { Normal },
    Structure      { Normal },
    Typedef        { Normal },
    Special        { Normal },
    SpecialChar    { Normal },
    Tag            { Normal },
    Delimiter      { Normal },
    SpecialComment { Normal },
    Debug          { Normal },
    Underlined     { Normal },
    Ignore         { Normal },
    Error          { Normal },
    Todo           { Normal },
    Title          { Normal },

    -- Explicit root captures prevent Tree-sitter from reintroducing colour.
    sym"@variable"    { Normal },
    sym"@constant"    { Normal },
    sym"@module"      { Normal },
    sym"@namespace"   { Normal },
    sym"@label"       { Normal },
    sym"@string"      { Normal },
    sym"@character"   { Normal },
    sym"@boolean"     { Normal },
    sym"@number"      { Normal },
    sym"@float"       { Normal },
    sym"@type"        { Normal },
    sym"@attribute"   { Normal },
    sym"@property"    { Normal },
    sym"@field"       { Normal },
    sym"@parameter"   { Normal },
    sym"@function"    { Normal },
    sym"@method"      { Normal },
    sym"@constructor" { Normal },
    sym"@operator"    { Normal },
    sym"@keyword"     { Normal },
    sym"@conditional" { Normal },
    sym"@repeat"      { Normal },
    sym"@exception"   { Normal },
    sym"@include"     { Normal },
    sym"@preproc"     { Normal },
    sym"@punctuation" { Normal },
    sym"@comment"     { Normal },
    sym"@text"        { Normal },
    sym"@markup"      { Normal },
    sym"@tag"         { Normal },

    ---------------------------------------------------------------------------
    -- LSP and diagnostics: references use Acme selection; diagnostics use
    -- Acme's red/green selectors without recolouring source tokens.
    ---------------------------------------------------------------------------

    LspReferenceText            { bg = acme_selection },
    LspReferenceRead            { LspReferenceText },
    LspReferenceWrite           { LspReferenceText },
    LspCodeLens                 { bg = acme_bg, fg = acme_muted },
    LspCodeLensSeparator        { LspCodeLens },
    LspSignatureActiveParameter { bg = acme_selection, fg = acme_fg },

    DiagnosticError { fg = acme_red },
    DiagnosticWarn  { fg = acme_muted },
    DiagnosticInfo  { fg = acme_modified },
    DiagnosticHint  { fg = acme_green },
    DiagnosticOk    { fg = acme_green },

    DiagnosticVirtualTextError { DiagnosticError },
    DiagnosticVirtualTextWarn  { DiagnosticWarn },
    DiagnosticVirtualTextInfo  { DiagnosticInfo },
    DiagnosticVirtualTextHint  { DiagnosticHint },
    DiagnosticVirtualTextOk    { DiagnosticOk },

    DiagnosticUnderlineError { sp = acme_red, gui = "undercurl" },
    DiagnosticUnderlineWarn  { sp = acme_muted, gui = "undercurl" },
    DiagnosticUnderlineInfo  { sp = acme_modified, gui = "underline" },
    DiagnosticUnderlineHint  { sp = acme_green, gui = "underline" },
    DiagnosticUnderlineOk    { sp = acme_green, gui = "underline" },

    DiagnosticFloatingError { DiagnosticError },
    DiagnosticFloatingWarn  { DiagnosticWarn },
    DiagnosticFloatingInfo  { DiagnosticInfo },
    DiagnosticFloatingHint  { DiagnosticHint },
    DiagnosticFloatingOk    { DiagnosticOk },
    DiagnosticSignError     { DiagnosticError },
    DiagnosticSignWarn      { DiagnosticWarn },
    DiagnosticSignInfo      { DiagnosticInfo },
    DiagnosticSignHint      { DiagnosticHint },
    DiagnosticSignOk        { DiagnosticOk },

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
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory      { }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    -- SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal         { }, -- Normal text
    -- NormalFloat    { }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    -- Pmenu          { }, -- Popup menu: Normal item.
    -- PmenuSel       { }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- StatusLine     { }, -- Status line of current window
    -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    -- Visual         { }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg     { }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    -- Constant       { }, -- (*) Any constant
    -- String         { }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    -- Identifier     { }, -- (*) Any variable name
    -- Function       { }, --   Function name (also: methods for classes)

    -- Statement      { }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    -- Special        { }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error          { }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
