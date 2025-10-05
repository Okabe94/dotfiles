-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("rose-pine").setup({
  inherit = false,
  variant = "main",      -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true,        -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  palette = {
    -- Override the builtin palette per variant
    -- moon = {
    --     base = '#18191a',
    --     overlay = '#363738',
    -- },
  },

  highlight_groups = {
    -- Comment = { fg = "foam" },
    StatusLine = { fg = "love", bg = "love", blend = 15 },
    VertSplit = { fg = "muted", bg = "muted" },
    Visual = { fg = "base", bg = "text", inherit = false },
  },

  before_highlight = function(group, highlight, palette)
    -- Disable all undercurls
    if highlight.undercurl then
      highlight.undercurl = false
    end
    --
    -- Change palette colour
    if highlight.fg == palette.pine then
      highlight.fg = palette.foam
    end
  end,
})

vim.cmd("colorscheme rose-pine")

require("nvim-highlight-colors").setup {
  ---Render style
  ---@usage 'background'|'foreground'|'virtual'
  render = 'virtual',

  ---Set virtual symbol (requires render to be set to 'virtual')
  virtual_symbol = '■',

  ---Set virtual symbol suffix (defaults to '')
  virtual_symbol_prefix = ' ',

  ---Set virtual symbol suffix (defaults to ' ')
  virtual_symbol_suffix = '',

  ---Set virtual symbol position()
  ---@usage 'inline'|'eol'|'eow'
  ---inline mimics VS Code style
  ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
  ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
  virtual_symbol_position = 'eow',

  ---Highlight hex colors, e.g. '#FFFFFF'
  enable_hex = true,

  ---Highlight short hex colors e.g. '#fff'
  enable_short_hex = true,

  ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
  enable_rgb = true,

  ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
  enable_hsl = true,

  ---Highlight ansi colors, e.g '\033[0;34m'
  enable_ansi = true,

  -- Highlight hsl colors without function, e.g. '--foreground: 0 69% 69%;'
  enable_hsl_without_function = true,

  ---Highlight CSS variables, e.g. 'var(--testing-color)'
  enable_var_usage = true,

  ---Highlight named colors, e.g. 'green'
  enable_named_colors = true,

  ---Highlight tailwind colors, e.g. 'bg-blue-500'
  enable_tailwind = false,

  ---Set custom colors
  ---Label must be properly escaped with '%' to adhere to `string.gmatch`
  --- :help string.gmatch
  custom_colors = {
    { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
  },

  -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
  exclude_filetypes = {},
  exclude_buftypes = {},
  -- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
  exclude_buffer = function(bufnr) end
}
