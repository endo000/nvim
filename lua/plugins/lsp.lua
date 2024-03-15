local ensure_installed = {
  'lua_ls',
  'stylua',
  'gopls',
  'bashls',
  'shfmt',
  'dockerls',
  'docker_compose_language_service',
  'jsonls',
  'jdtls',
  'deno',
}

return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        config = function()
          vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('config-lsp-attach', { clear = true }),
            callback = function(event)
              require('mappings').lsp(event)
            end,
          })
        end,
      },
      {
        'williamboman/mason.nvim',
        opts = {},
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = ensure_installed,
        }
      }
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      local servers = {
        lua_ls = {
          opts = {
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    '${3rd}/luv/library',
                    unpack(vim.api.nvim_get_runtime_file('', true)),
                  }
                },
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
          },
        },

        docker_compose_language_service = {
          opts = {
            filetypes = { 'Dockerfile', 'dockerfile', 'yaml' },
          },
        },

        jdtls = {
          exec_before = function()
            require('java').setup()
          end
        }
      }

      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup()
      mason_lspconfig.setup_handlers({
        function(server_name)
          local server = servers[server_name] or {}

          if server.exec_before then
            server.exec_before()
          end

          local opts = server.opts or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, opts.capabilities or {})
          lspconfig[server_name].setup(opts)
        end,
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = 'rafamadriz/friendly-snippets',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end
      },
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      {
        'zbirenbaum/copilot-cmp',
        opts = {},
      },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      luasnip.config.setup({})

      cmp.setup({
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'calc' },
          { name = 'copilot' },
        },
        window = {
          completion = {
            border = 'rounded',
          },
          documentation = {
            border = 'rounded',
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            menu = ({
              nvim_lsp = '[LSP]',
              luasnip = '[LuaSnip]',
              path = '[Path]',
              buffer = '[Buffer]',
              calc = '[Calc]',
              copilot = '[Copilot]',
            })
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        completions = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require('copilot_cmp.comparators').prioritize,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })
    end,
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {}
  },
  {
    'j-hui/fidget.nvim',
    opts = {}
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        -- python = { "isort", "black" },
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
    config = function(_, opts)
      require('conform').setup(opts)
      require('mappings').conform()
    end
  },
}
