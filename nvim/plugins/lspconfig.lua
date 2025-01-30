require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
})

require("lsp_signature").setup({
  bind = true,                           -- This is mandatory, otherwise border config won't work
  doc_lines = 10,                        -- Limit the number of lines shown in the signature help
  floating_window = true,                -- Show function signature in floating window
  floating_window_above_cur_line = true, -- Try to place the floating window above the current line
  hint_enable = false,                   -- Disable virtual text hints
  max_height = 12,                       -- Max height of the floating window
  max_width = 80,                        -- Max width of the floating window
  handler_opts = {
    border = "rounded",                  -- Border style
  },
  zindex = 50,                           -- Set z-index for the floating window
  toggle_key = "<C-x>",                  -- Key to toggle the signature help manually
})

local lsp_config = require("lspconfig")

local on_attach = function(client, bufnr)
  -- Add LSP keybindings here if needed

  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, {})

  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

  -- bufmap('gr', require('telescope.builtin').lsp_references)
  -- bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  -- bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)


  -- Call lsp_signature on_attach
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,
    hint_enable = false,
    handler_opts = {
      border = "rounded",
    },
  }, bufnr)
end


lsp_config.lua_ls.setup({ on_attach = on_attach })
lsp_config.clangd.setup({ on_attach = on_attach })
lsp_config.pyright.setup({ on_attach = on_attach })
lsp_config.gopls.setup({ on_attach = on_attach })
lsp_config.nil_ls.setup({ on_attach = on_attach })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gr", require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, {})

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
