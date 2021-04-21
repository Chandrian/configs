require'nvim-treesitter.configs'.setup {
--  ensure_installed = "maintained" -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "lua" , "go", "rust" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
