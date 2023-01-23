local servers = {
	pyright = {},
	clangd = {},
	bashls = {},
	hls = {
		haskell = {
			formattingProvider = "fourmolu",
		},
	},
	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim", "client", "awesome" },
			},
		},
	},
}

local null_ls_sources = {
	"stylua",
	"black",
	"fourmolu",
}

local lsp_keymaps = function(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "[D]iagnostics: open [F]loat" })
	vim.keymap.set("n", "<leader>dh", vim.diagnostic.goto_prev, { desc = "[D]iagnostics: goto prev" })
	vim.keymap.set("n", "<leader>dl", vim.diagnostic.goto_next, { desc = "[D]iagnostics: goto next" })
	vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "[D]iagnostics: list" })
	nmap("gD", vim.lsp.buf.declaration, "LSP: [G]o to [D]eclaration")
	nmap("gd", vim.lsp.buf.definition, "LSP: [G]o to [D]efinition")
	nmap("K", vim.lsp.buf.hover, "LSP: Hover")
	nmap("gi", vim.lsp.buf.implementation, "LSP: [G]o to [I]mplementation")
	-- nmap("n", "<C-k>", vim.lsp.buf.signature_help, '')
	-- nmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '')
	-- nmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '')
	-- nmap('n', '<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '')
	nmap("<leader>D", vim.lsp.buf.type_definition, "LSP: Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>rn", vim.lsp.buf.rename, "LSP: [R]e[N]ame")
	nmap("<space>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction")
	nmap("gr", vim.lsp.buf.references, "LSP: [G]o to [R]eferences")
	nmap("<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, "[L]SP: [F]ormat")
end

local function lsp_highlight_document()
	vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
end

local on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document()
end

local cap = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(cap)

-- local opts = {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }

require("mason-lspconfig").setup_handlers({

	function(server_name)
		-- local require_ok, conf_opts = pcall(require, "bozo.lsp.settings." .. server_name)
		-- if require_ok then
		-- 	opts = vim.tbl_deep_extend("force", conf_opts, opts)
		-- end
		--
		-- require("lspconfig")[server_name].setup(opts)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

require("mason").setup({
	ui = {
		border = "single",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,
})

require("mason-null-ls").setup({
	ensure_installed = null_ls_sources,
})

-- Turn on lsp status information
require("fidget").setup()

local null_ls = require("null-ls")

require("mason-null-ls").setup_handlers({
	function(source_name, methods)
		require("mason-null-ls.automatic_setup")(source_name, methods)
	end,
})

null_ls.setup()

local config = {
	virtual_text = {
		source = false,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = false,
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})
