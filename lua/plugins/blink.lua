return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*", -- pinned to stable v1; v2 is still in active breaking-change development

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" }, -- C-y accept, C-n/C-p or arrows to navigate, C-space to open/show docs
    appearance = {
      nerd_font_variant = "mono", -- matches JetBrainsMono Nerd Font
    },
    completion = {
      documentation = { auto_show = false },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
