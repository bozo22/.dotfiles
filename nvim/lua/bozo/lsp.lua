local servers = {
	pyright = {}, -- python
	clangd = {}, -- c, c++
	bashls = {}, -- bash
	hls = {
		haskell = {
			formattingProvider = "fourmolu",
		},
	}, -- haskell
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim", "client", "awesome" },
			},
		},
	},          -- lua
	html = {},  -- html
	cssls = {}, -- css
	eslint = {}, -- javascript
	jdtls = {}, -- java
	jsonls = {}, -- json
	lemminx = {}, -- xml
	texlab = {}, -- latex
	marksman = {}, -- markdown
	yamlls = {}, -- yaml
}

local null_ls_sources = {
	"stylua",    -- lua
	"black",     -- python
	"mypy",      -- python static type checking
	"fourmolu",  -- haskell
	"clang_format", -- c, c++, c#, java, javascript, json
	"prettierd", -- javascript, typescript, flow, jsx, json, css, scss, less, html, vue, angular, graphql, markdown, yaml
	"shfmt",     -- bash
	"latexindent", -- latex
	"xmlformat", -- xml
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
	vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, { desc = "Diagnostics: open [F]loat" })
	-- vim.keymap.set("n", "<leader>fh", vim.diagnostic.goto_prev, { desc = "Diagnostics: goto prev" })
	-- vim.keymap.set("n", "<leader>fl", vim.diagnostic.goto_next, { desc = "Diagnostics: goto next" })
	vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "Diagnostics: [L]ist [D]iagnostics" })
	nmap("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
	-- nmap("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
	nmap("gd", require("telescope.builtin").lsp_definitions, "Telescope: [G]o to [D]efinition")
	nmap("K", vim.lsp.buf.hover, "Hover")
	nmap("gi", vim.lsp.buf.implementation, "[G]o to [I]mplementation")
	nmap("<S-CR>", '<Cmd>:TermExec cmd="python %:p"<CR>', "Run")
	-- nmap("<S-CR>", require('toggleterm').exec_command('cmd="python %:p"<CR>'), "Run")
	-- nmap("n", "<C-k>", vim.lsp.buf.signature_help, '')
	-- nmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '')
	-- nmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '')
	-- nmap('n', '<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '')
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]ist document [S]ymbols")
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame symbol")
	nmap("<F2>", vim.lsp.buf.rename, "Rename symbol")
	nmap("<M-CR>", vim.lsp.buf.code_action, "Code [A]ction")
	nmap("gr", vim.lsp.buf.references, "[G]o to [R]eferences")
	nmap("<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, "[F]ormat")
end

-- local function lsp_highlight_document()
-- 	vim.cmd([[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]])
-- end

local on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
	-- lsp_highlight_document()
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

	["jdtls"] = function()
		-- require("jdtls").start_or_attach({
		-- 	--capabilities = capabilities,
		-- 	--on_attach = on_attach,
		-- 	cmd = { "/home/bozo/.local/share/nvim/mason/packages/jdtls/bin/jdtls" },
		-- 	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
		-- })
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
-- require("fidget").setup()

local null_ls = require("null-ls")

require("mason-null-ls").setup({
	handlers = {
		function(source_name, methods)
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
	},
})

null_ls.setup()

vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "i", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

local config = {
	virtual_text = { source = "if_many" },
	update_in_insert = true,
	underline = true,
	signs = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "if_many",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})
