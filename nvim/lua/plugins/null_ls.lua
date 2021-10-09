local null_ls = require("null-ls")

null_ls.config({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.stylelint,
	},
})

-- format on save
local on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()")
	end
end

require("lspconfig")["null-ls"].setup({
	on_attach = on_attach,
})
