local function setup_servers()
	local lsp_install = require("lspinstall")
	lsp_install.setup({})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	local servers = lsp_install.installed_servers()
	for _, server in pairs(servers) do
		require("lspconfig")[server].setup({
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers()
	vim.cmd([[bufdo e]])
end
