return {

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup {
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "typescript-language-server",
      },
    }
    end
  },

}
