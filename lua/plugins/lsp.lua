return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "clangd" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" }, -- ensures blink loads first, so require("blink.cmp") below works
    config = function()
      -- Give every LSP server blink.cmp's expanded capabilities
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- clangd-specific: query the real system compiler for correct macOS SDK paths
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--query-driver=/usr/bin/clang" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, fn) vim.keymap.set("n", keys, fn, { buffer = args.buf }) end
          map("gd", vim.lsp.buf.definition)
          map("gr", vim.lsp.buf.references)
          map("K", vim.lsp.buf.hover)
          map("<leader>rn", vim.lsp.buf.rename)
          map("<leader>ca", vim.lsp.buf.code_action)
        end,
      })
    end,
  },
}
