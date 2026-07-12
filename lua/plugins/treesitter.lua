return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",   -- the rewrite; old default branch is frozen/incompatible
  build = ":TSUpdate",
  lazy = false,       -- this plugin doesn't support lazy-loading
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- parsers to have on hand; add more later with :TSInstall <lang>
    require("nvim-treesitter").install({ "c", "lua", "vim", "vimdoc", "query" }):wait(300000)

    -- highlighting/folding/indent are opt-in per filetype in the new plugin
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "lua" }, -- extend as you install more parsers
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
