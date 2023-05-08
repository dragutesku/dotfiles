require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

-- Setup language servers.
require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'rust_analyzer',
    'tsserver',
    'cssls',
    'cssmodules_ls'
  }
})

