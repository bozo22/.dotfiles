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
	-- nmap("n", "<C-k>", vim.lsp.buf.signature_help, '')
	-- nmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '')
	-- nmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '')
	-- nmap('n', '<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '')
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ls", require("telescope.builtin").lsp_document_symbols, "[L]ist document [S]ymbols")
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame")
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

local cap = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
	-- lsp_highlight_document()
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(cap)
require("jdtls").start_or_attach({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "/home/bozo/.local/share/nvim/mason/packages/jdtls/bin/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
})
