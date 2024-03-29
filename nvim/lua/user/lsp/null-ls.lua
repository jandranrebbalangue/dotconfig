local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
--local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })")
			--[[ vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nill,2000)") ]]
		end
	end,
	sources = {
 -- null_ls.builtins.formatting.prettier,
    --[[ formatting.prettier.with({ ]]
    --[[   filetypes = { ]]
    --[[     "javascript", ]]
    --[[     "javascriptreact", ]]
    --[[     "typescript", ]]
    --[[     "typescriptreact", ]]
    --[[     "vue", ]]
    --[[     "css", ]]
    --[[     "scss", ]]
    --[[     "less", ]]
    --[[     "html", ]]
    --[[     "json", ]]
    --[[     "yaml", ]]
    --[[     "markdown", ]]
    --[[     "graphql", ]]
    --[[     "heex", ]]
    --[[   }, ]]
    --[[ }), ]]
  formatting.eslint,
    formatting.mix,
    formatting.elm_format,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.djhtml,
    formatting.gofmt,
    formatting.prismaFmt,
  }
})

--null_ls.setup({
--	debug = false,
--	sources = {
--	formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
--formatting.black.with({ extra_args = { "--fast" } }),
--formatting.stylua,
-- diagnostics.flake8
--},
--})
