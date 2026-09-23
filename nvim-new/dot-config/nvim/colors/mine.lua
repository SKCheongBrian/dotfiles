-- mine: standalone colorscheme using the supplied Caelus palette.
-- Save as ~/.config/nvim/colors/mine.lua and load with :colorscheme mine.
local p = {
  bg = "#0f0f0f",
  gray0 = "#141514", gray1 = "#1e1f1e", gray2 = "#272a28",
  gray3 = "#3b403c", gray4 = "#585f5b", gray5 = "#6c756f",
  gray6 = "#888e7b", gray7 = "#9a9c8b", gray8 = "#b6b69a",
  gray9 = "#d9cdb5", gray10 = "#e3d6c9",
  fg = "#f4decd",
  red = "#f16e65", lred = "#ef968f",
  orange = "#ef934d", yellow = "#efbf71",
  green = "#7ec97e", lgreen = "#a4daa4",
  cyan = "#7ec9a3", lcyan = "#abd4bf",
  blue = "#71b4d6", lblue = "#b0d4e8",
  magenta = "#e28dc6", lmagenta = "#ebadd6",
}

local function blend(fg, bg, amount)
  local rgb = {}
  for i = 1, 3 do
    local offset = i * 2
    local a = tonumber(fg:sub(offset, offset + 1), 16)
    local b = tonumber(bg:sub(offset, offset + 1), 16)
    rgb[i] = math.floor(a * amount + b * (1 - amount) + 0.5)
  end
  return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

p.surface = p.gray1
p.line = p.gray2
p.highlight = p.gray2
p.selection = p.gray3
p.comment = p.gray8
p.dim = p.gray4

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "mine"

local colors = {
  Normal = { fg = p.fg, bg = p.bg },
  NormalNC = { link = "Normal" },
  MsgArea = { link = "Normal" },

  -- Syntax assignments from the supplied theme; operators remain cyan.
  Identifier = { fg = p.blue },
  Variable = { fg = p.fg },
  Comment = { fg = p.comment, italic = true },
  Constant = { fg = p.magenta },
  String = { fg = p.green },
  Character = { link = "String" },
  Number = { link = "Constant" },
  Boolean = { link = "Constant" },
  Float = { link = "Constant" },
  Function = { fg = p.yellow },
  Statement = { fg = p.red },
  Keyword = { link = "Statement" },
  Conditional = { link = "Statement" },
  Repeat = { link = "Statement" },
  Exception = { link = "Statement" },
  Label = { link = "Statement" },
  Operator = { fg = p.cyan },
  TSOperator = { link = "Operator" },
  PreProc = { fg = p.cyan },
  Include = { link = "PreProc" },
  Define = { link = "PreProc" },
  Macro = { link = "PreProc" },
  PreCondit = { link = "PreProc" },
  Type = { fg = p.cyan, bold = true },
  TSType = { fg = p.cyan },
  TSKeyword = { link = "Keyword" },
  TSFunction = { link = "Function" },
  TSVariable = { link = "Variable" },
  StorageClass = { link = "Keyword" },
  Structure = { link = "Type" },
  Typedef = { link = "Type" },
  Special = { fg = p.yellow },
  SpecialChar = { link = "Special" },
  SpecialComment = { fg = p.comment, bold = true },
  Delimiter = { fg = p.gray9 },
  Tag = { fg = p.blue },
  Debug = { fg = p.red },
  Directory = { fg = p.blue },
  Title = { fg = p.blue, bold = true },
  Underlined = { fg = p.blue, underline = true },
  Ignore = { fg = p.gray5 },
  Error = { fg = p.red, bold = true },
  Todo = { fg = p.orange, bold = true },
  ColorColumn = {bg = p.highlight},
  Conceal = {fg = p.gray5, bg = p.bg},
  CurSearch = {fg = p.bg, bg = p.orange},
  IncSearch = {link = "CurSearch"},
  Substitute = {link = "CurSearch"},
  Cursor = {fg = p.bg, bg = p.gray9},
  CursorIM = {link = "Cursor"},
  TermCursor = {link = "Cursor"},
  lCursor = {link = "Cursor"},
  CursorColumn = {bg = p.line},
  CursorLine = {bg = p.line},
  CursorLineNr = { fg = p.orange, bold = true },
  DiagnosticError = {fg = p.red},
  DiagnosticFloatingError = {link = "DiagnosticError"},
  DiagnosticSignError = {link = "DiagnosticError"},
  DiagnosticVirtualTextError = {link = "DiagnosticError"},
  DiagnosticHint = {fg = p.cyan},
  DiagnosticFloatingHint = {link = "DiagnosticHint"},
  DiagnosticSignHint = {link = "DiagnosticHint"},
  DiagnosticVirtualTextHint = {link = "DiagnosticHint"},
  DiagnosticInfo = {fg = p.blue},
  DiagnosticFloatingInfo = {link = "DiagnosticInfo"},
  DiagnosticSignInfo = {link = "DiagnosticInfo"},
  DiagnosticVirtualTextInfo = {link = "DiagnosticInfo"},
  DiagnosticOk = {fg = p.green},
  DiagnosticFloatingOk = {link = "DiagnosticOk"},
  DiagnosticSignOk = {link = "DiagnosticOk"},
  DiagnosticVirtualTextOk = {link = "DiagnosticOk"},
  DiagnosticUnderlineError = {sp = p.red, undercurl = true},
  DiagnosticUnderlineHint = {sp = p.cyan, underline = true},
  DiagnosticUnderlineInfo = {sp = p.blue, underline = true},
  DiagnosticUnderlineOk = {sp = p.green, underline = true},
  DiagnosticUnderlineWarn = {sp = p.orange, undercurl = true},
  DiagnosticWarn = {fg = p.orange},
  DiagnosticFloatingWarn = {link = "DiagnosticWarn"},
  DiagnosticSignWarn = {link = "DiagnosticWarn"},
  DiagnosticVirtualTextWarn = {link = "DiagnosticWarn"},
  EndOfBuffer = {fg = p.bg, bg = p.bg},
  ErrorMsg = {fg = p.red, bg = p.bg},
  FloatBorder = { fg = p.fg, bg = p.bg },
  FloatTitle = { fg = p.yellow, bg = p.bg, bold = true },
  FoldColumn = {fg = p.gray5, bg = p.bg},
  Folded = { fg = p.gray8, bg = p.gray3 },
  LineNr = { fg = p.gray6 },
  LineNrAbove = {link = "LineNr"},
  LineNrBelow = {link = "LineNr"},
  LspCodeLens = {fg = p.gray5, bg = p.bg},
  LspCodeLensSeparator = {link = "LspCodeLens"},
  LspReferenceText = {bg = p.highlight},
  LspReferenceRead = {link = "LspReferenceText"},
  LspReferenceWrite = {link = "LspReferenceText"},
  LspSignatureActiveParameter = {fg = p.fg, bg = p.highlight},
  MatchParen = {fg = p.fg, bg = p.highlight, bold = true},
  ModeMsg = {fg = p.fg, bg = p.bg, bold = true},
  MoreMsg = {fg = p.green, bg = p.bg},
  MsgSeparator = {fg = p.gray5, bg = p.surface},
  NonText = {fg = p.dim},
  NormalFloat = { fg = p.fg, bg = p.bg },
  -- Dark text keeps the supplied light popup background readable.
  Pmenu = { fg = p.bg, bg = p.gray10 },
  PmenuKind = {link = "Pmenu"},
  PmenuExtra = { fg = p.gray3, bg = p.gray10 },
  PmenuSbar = { bg = p.gray10 },
  PmenuSel = { fg = p.bg, bg = p.orange },
  PmenuExtraSel = {link = "PmenuSel"},
  PmenuKindSel = {link = "PmenuSel"},
  WildMenu = {link = "PmenuSel"},
  PmenuThumb = { bg = p.orange },
  Question = {fg = p.blue, bg = p.bg},
  QuickFixLine = {fg = p.bg, bg = p.blue},
  Search = { fg = p.bg, bg = p.orange },
  SignColumn = {fg = p.fg, bg = p.bg},
  SpecialKey = {fg = p.dim},
  SpellBad = {sp = p.red, undercurl = true},
  SpellCap = {sp = p.blue, undercurl = true},
  SpellLocal = {sp = p.green, undercurl = true},
  SpellRare = {sp = p.magenta, undercurl = true},
  StatusLine = { fg = p.fg, bg = p.gray2 },
  StatusLineNC = { fg = p.bg, bg = p.orange },
  TabLine = {fg = p.fg, bg = p.surface},
  TabLineFill = {fg = p.gray5, bg = p.surface},
  TabLineSel = {fg = p.bg, bg = p.blue, bold = true},
  Visual = {bg = p.selection},
  VisualNOS = {link = "Visual"},
  WarningMsg = {fg = p.orange, bg = p.bg},
  Whitespace = {fg = p.dim},
  WinBar = {fg = p.fg, bg = p.surface, bold = true},
  WinBarNC = {fg = p.gray5, bg = p.surface},
  WinSeparator = { fg = p.gray8 },
  VertSplit = {link = "WinSeparator"},

  -- Blink completion and documentation.
  BlinkCmpMenu = { fg = p.fg, bg = p.gray1 },
  BlinkCmpMenuBorder = { fg = p.gray6, bg = p.gray1 },
  BlinkCmpMenuSelection = { fg = p.bg, bg = p.orange },
  BlinkCmpLabel = { fg = p.fg },
  BlinkCmpLabelDetail = { fg = p.gray7 },
  BlinkCmpLabelDescription = { fg = p.gray8 },
  BlinkCmpLabelMatch = { fg = p.orange, bold = true },
  BlinkCmpKind = { fg = p.cyan },
  BlinkCmpDoc = { fg = p.fg, bg = p.gray2 },
  BlinkCmpDocBorder = { fg = p.gray5, bg = p.gray2 },

  -- Subtle backgrounds keep diagnostics and changes readable without glare.
  DiffAdd = { bg = blend(p.green, p.bg, 0.12) },
  DiffChange = { bg = blend(p.blue, p.bg, 0.10) },
  DiffDelete = { fg = p.red, bg = blend(p.red, p.bg, 0.12) },
  DiffText = { bg = blend(p.blue, p.bg, 0.24), bold = true },
  Added = { fg = p.green },
  Changed = { fg = p.blue },
  Removed = { fg = p.red },
  LspInlayHint = { fg = p.comment, bg = p.surface },
  MiniPickNormal = { link = "NormalFloat" },
  MiniPickBorder = { link = "FloatBorder" },
  MiniPickBorderText = { fg = p.cyan, bg = p.bg },
  MiniPickPrompt = { fg = p.blue, bg = p.bg },
  MiniPickMatchCurrent = { bg = p.selection, bold = true },
  MiniPickMatchMarked = { bg = blend(p.cyan, p.bg, 0.15) },
  MiniPickMatchRanges = { fg = p.orange, bold = true },
  GitSignsAdd = { link = "Added" },
  GitSignsChange = { link = "Changed" },
  GitSignsDelete = { link = "Removed" },
}

local function link(group, target)
  colors[group] = { link = target }
end

-- Tree-sitter captures, including older names still used by some queries.
local captures = {
  ["variable"] = "Variable", ["variable.builtin"] = "Special",
  ["variable.parameter"] = "Variable", ["variable.member"] = "Identifier",
  ["constant"] = "Constant", ["constant.builtin"] = "Constant",
  ["constant.macro"] = "Macro", ["module"] = "Type",
  ["module.builtin"] = "Type", ["label"] = "Label",
  ["string"] = "String", ["string.documentation"] = "String",
  ["string.regexp"] = "Special", ["string.escape"] = "SpecialChar",
  ["string.special"] = "Special", ["string.special.url"] = "Underlined",
  ["character"] = "Character", ["character.special"] = "SpecialChar",
  ["boolean"] = "Boolean", ["number"] = "Number", ["number.float"] = "Float",
  ["type"] = "TSType", ["type.builtin"] = "TSType", ["type.definition"] = "TSType",
  ["attribute"] = "PreProc", ["property"] = "Identifier",
  ["function"] = "Function", ["function.builtin"] = "Function",
  ["function.call"] = "Function", ["function.macro"] = "Macro",
  ["function.method"] = "Function", ["function.method.call"] = "Function",
  ["constructor"] = "Type", ["operator"] = "Operator",
  ["keyword"] = "Keyword", ["keyword.function"] = "Keyword",
  ["keyword.operator"] = "Operator", ["keyword.import"] = "Include",
  ["keyword.directive"] = "PreProc", ["keyword.type"] = "Keyword",
  ["keyword.return"] = "Keyword", ["keyword.conditional"] = "Conditional",
  ["keyword.repeat"] = "Repeat", ["keyword.exception"] = "Exception",
  ["punctuation"] = "Delimiter", ["punctuation.delimiter"] = "Delimiter",
  ["punctuation.bracket"] = "Delimiter", ["punctuation.special"] = "Special",
  ["comment"] = "Comment", ["comment.documentation"] = "Comment",
  ["comment.error"] = "DiagnosticError", ["comment.warning"] = "DiagnosticWarn",
  ["comment.todo"] = "Todo", ["comment.note"] = "DiagnosticInfo",
  ["markup"] = "Variable", ["markup.heading"] = "Title",
  ["markup.link"] = "Underlined", ["markup.link.url"] = "Underlined",
  ["markup.raw"] = "String", ["markup.list"] = "Special",
  ["markup.quote"] = "Comment", ["markup.math"] = "Type",
  ["diff.plus"] = "Added", ["diff.minus"] = "Removed", ["diff.delta"] = "Changed",
  ["tag"] = "Tag", ["tag.attribute"] = "Type", ["tag.delimiter"] = "Delimiter",
  ["field"] = "Identifier", ["parameter"] = "Variable", ["method"] = "Function",
  ["namespace"] = "Type", ["float"] = "Float", ["include"] = "Include",
  ["preproc"] = "PreProc", ["conditional"] = "Conditional",
  ["repeat"] = "Repeat", ["exception"] = "Exception", ["text"] = "Variable",
}
for capture, target in pairs(captures) do
  link("@" .. capture, target)
end
colors["@markup.strong"] = { bold = true }
colors["@markup.italic"] = { italic = true }
colors["@markup.strikethrough"] = { strikethrough = true }
link("@text.strong", "@markup.strong")
link("@text.emphasis", "@markup.italic")
link("@text.literal", "String")
link("@text.title", "Title")
link("@text.uri", "Underlined")

-- Semantic tokens use the same roles as traditional syntax and Tree-sitter.
-- Explicit .lean groups also cover Lean's filetype-specific token links.
local semantic = {
  namespace = "TSType", type = "TSType", class = "TSType", enum = "TSType",
  interface = "TSType", struct = "TSType", typeParameter = "TSType",
  parameter = "Variable", variable = "Variable", property = "Identifier",
  enumMember = "Constant", event = "Special", ["function"] = "Function",
  method = "Function", macro = "Macro", keyword = "Keyword",
  modifier = "Keyword", comment = "Comment", string = "String",
  number = "Number", regexp = "Special", operator = "Operator",
  decorator = "PreProc",
}
for token, target in pairs(semantic) do
  link("@lsp.type." .. token, target)
  link("@lsp.type." .. token .. ".lean", target)
end
colors["@lsp.mod.deprecated"] = { strikethrough = true }
link("@lsp.typemod.variable.readonly", "Constant")
link("@lsp.typemod.variable.defaultLibrary", "Special")

for severity, color in pairs({ Error = p.red, Warn = p.orange,
  Info = p.blue, Hint = p.cyan, Ok = p.green }) do
  colors["DiagnosticVirtualText" .. severity] = {
    fg = color, bg = blend(color, p.bg, 0.07),
  }
  link("DiagnosticVirtualLines" .. severity, "Diagnostic" .. severity)
end

for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end

-- The same sixteen ANSI colors as the Ghostty theme.
local terminal_colors = {
  p.bg, p.red, p.green, p.orange, p.blue, p.magenta, p.cyan, p.gray9,
  p.gray5, p.red, p.green, p.orange, p.blue, p.magenta, p.cyan, p.fg,
}
for index, color in ipairs(terminal_colors) do
  vim.g["terminal_color_" .. (index - 1)] = color
end

-- Preserve the original theme's refresh for an already-loaded lualine.
if package.loaded["lualine"] then
  require("lualine").setup({ options = { theme = "auto" } })
end

