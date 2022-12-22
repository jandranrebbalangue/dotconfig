local status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end


local servers = { "jsonls", "sumneko_lua", "tsserver","dockerls","yamlls","bashls","rust_analyzer","html","golangci_lint_ls","gopls","eslint"}

mason_lsp_config.setup({
    ensure_installed = servers
})


