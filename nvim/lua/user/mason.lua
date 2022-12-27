local servers = { "jsonls", "sumneko_lua", "tsserver","dockerls","yamlls","bashls","rust_analyzer","html","golangci_lint_ls","gopls","eslint"}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
  automatic_installation = true
}
require("mason-lspconfig").setup_handlers({
 function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	if server == "tsserver" then
	    local tsserver_opts = require("user.lsp.settings.tsserver")
	    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	  end

	 if server == "html" then
	    local html_opts = require("user.lsp.settings.html")
	    opts = vim.tbl_deep_extend("force", html_opts, opts)
	  end

	  if server == "rust_analyzer" then
	    local rust_opts = require("user.lsp.settings.rust_analyzer")
	    opts = vim.tbl_deep_extend("force", rust_opts, opts)
	  end

	  if server == "eslint" then
	    local eslint_opts = require("user.lsp.settings.eslint")
	    opts = vim.tbl_deep_extend("force",eslint_opts, opts)
	  end
      
      require("lspconfig")[server].setup(opts)
 end})
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

