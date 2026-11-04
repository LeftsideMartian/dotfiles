return {
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        automatic_enable = true,
      })
    end
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'bashls',
          'cspell',
          'cspell',
          'docker_compose_language_service',
          'dockerfile-language-server',
          'dockerls',
          'gh-actions-language-server',
          'json-lsp',
          'lua_ls',
          'marksman',
          'prettier',
          'ts_ls',
          'yamlls',
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
                vim.fn.stdpath("data") .. "/lazy",
              },
            },
          },
        },
      })

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      })

      -- Override default marksman filetypes to remove markdown.mdx
      vim.lsp.config("marksman", {
        filetypes = { "markdown" },
      })
    end
  },
  {
    'b0o/schemastore.nvim',
  },
}
