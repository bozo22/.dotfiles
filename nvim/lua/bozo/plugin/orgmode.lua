local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end

-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		-- Required for spellcheck, some LaTex highlights and
		-- code block highlights that do not have ts grammar
		additional_vim_regex_highlighting = { "org" },
	},
	ensure_installed = { "org" }, -- Or run :TSUpdate org
})

orgmode.setup({
	org_agenda_files = { "~/Dropbox/org/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
	org_todo_keywords = { "TODO(t)", "|", "DONE(d)", "WAITING(w)" },
	org_todo_keyword_faces = {
		DONE = ":foreground green :weight bold",
	},
	org_log_done = nil,
})
