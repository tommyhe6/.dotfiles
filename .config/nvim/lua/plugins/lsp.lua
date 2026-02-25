return {
  {
    "neovim/nvim-lspconfig", -- still useful: provides lsp/<server>.lua configs
    config = function()
      -- 1) Capabilities (e.g. for nvim-cmp)
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- Use "*" to apply defaults to all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- 2) Diagnostics keymaps (global)
      local diag_opts = { noremap = true, silent = true }
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, diag_opts)
      vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, diag_opts)
      vim.keymap.set("n", "g]", vim.diagnostic.goto_next, diag_opts)

      -- 3) LSP keymaps (buffer-local)
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf, noremap = true, silent = true }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set({ "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "ch", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "gk", vim.lsp.buf.code_action, opts)
          -- vim.keymap.set("n", "go", function() vim.lsp.buf.format({ async = true }) end, opts)
        end,
      })

      -- 4) Diagnostics UI (prefer vim.diagnostic.config for signs)
      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        float = {
          focusable = false,
          style = "minimal",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- 5) Per-server overrides (only where you had custom setup)
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy" },
      })

      vim.lsp.config("dockerls", {
        cmd = { "docker-langserver", "--stdio" },
      })

      -- 6) Enable servers
      vim.lsp.enable({
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "gopls",
        "ts_ls",
        "clangd",
        "nixd",
        "racket_langserver",
        "sqls",
        "terraformls",
        "dockerls",
        -- "typos_lsp",
        "tinymist",
        -- "wgsl_analyzer",
      })
    end,
  },
}
