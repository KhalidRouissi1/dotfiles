return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- List of LSP servers to set up
      local servers = {
        "tailwindcss",
        "ts_ls",
        "jsonls",
        "bashls",
        "yamlls",
        "solargraph",
        "html",
        "lua_ls",
        "jdtls",
        "gopls",
        "pyright",
      }

      -- Debug: Check if lspconfig loaded correctly
      if not lspconfig then
        print("Error: Failed to load lspconfig.")
        return
      end

      -- Set up each LSP server
      for _, server in ipairs(servers) do
        local lsp = lspconfig[server]

        if lsp == nil then
          print("Error: LSP server '" .. server .. "' is not available.")
        else
          print("Setting up LSP server:", server)

          local opts = {
            capabilities = capabilities,
          }

          -- Specific settings for pyright
          if server == "pyright" then
            opts.settings = {
              python = {
                analysis = {
                  typeCheckingMode = "strict",
                },
              },
            }
          end

          -- Setup the LSP server
          lsp.setup(opts)
        end
      end

      -- Key mappings for LSP functions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show References" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    end,
  },
}

