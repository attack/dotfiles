require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "rust",
    "zig",
    "solidity",
    "elixir",
    "erlang",
    "ruby",
    "python",
    "lua",
    "html",
    "css",
    "javascript",
    "tsx",
    "typescript",
    "vim",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  -- sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- Enable code highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  -- Enable incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },

  -- Enable based on Treesitter Code formatting for (=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  },
}
-- Turn on Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- Don't collapse by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
