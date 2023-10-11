local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "lua_ls" then
	 	local sumneko_opts = require("user.lsp.settings.lua_ls")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	if server.name == "tsserver" then
	    local tsserver_opts = require("user.lsp.settings.tsserver")
	    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	  end

	 if server.name == "html" then
	    local html_opts = require("user.lsp.settings.html")
	    opts = vim.tbl_deep_extend("force", html_opts, opts)
	  end

	  if server.name == "rust_analyzer" then
	    local rust_opts = require("user.lsp.settings.rust_analyzer")
	    opts = vim.tbl_deep_extend("force", rust_opts, opts)
	  end

	  if server.name == "eslint" then
	    local eslint_opts = require("user.lsp.settings.eslint")
	    opts = vim.tbl_deep_extend("force",eslint_opts, opts)
	  end

	  if server.name == "python" then
	    local python_opts = require("user.lsp.settings.jedi_language_server")
	    opts = vim.tbl_deep_extend("force",python_opts, opts)
	  end
	  -- if server.name == "prismals" then
	  --   local prisma_opts = require("config.lsp.settings.prisma")
	  --   opts = vim.tbl_deep_extend("force", prisma_opts, opts)
	  -- end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
