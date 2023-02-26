local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end

-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

orgmode.setup({
	org_agenda_files = { "~/Dropbox/org/*" },
	org_default_notes_file = "~/Dropbox/org/todo.org",
	org_todo_keywords = { "TODO(t)", "PROJ(p)", "WAIT(w)", "|", "DONE(d)" },
	org_todo_keyword_faces = {
		DONE = ":foreground grey :weight bold",
		TODO = ":foreground green :weight bold",
		PROJ = ":foreground grey :slant italic :weight bold",
		WAIT = ":foreground orange :weight bold",
	},
	org_capture_templates = {
		t = {
			description = "Task",
			template = "* TODO %?",
		},
	},
	win_split_mode = "30split",
	org_indent_mode = "indent",
	org_agenda_start_on_weekday = false,
	-- org_src_window_setup = "enew",
	mappings = {
		agenda = {
			org_agenda_deadline = "<C-c><C-d>",
			org_agenda_schedule = "<C-c><C-s>",
			org_agenda_switch_to = "<C-c><TAB>",
			org_agenda_goto = "<CR>",
		},
		org = {
			org_deadline = "<C-c><C-d>",
			org_schedule = "<C-c><C-s>",
			org_todo = "<prefix>t",
			org_clock_in = "<prefix>I",
			org_clock_out = "<prefix>O",
			org_clock_cancel = "<prefix>X",
		},
		capture = {
			org_capture_finalize = "<C-x>",
		},
	},
})

local status_ok_multikey, orgmode_multi_key = pcall(require, "orgmode-multi-key")
if not status_ok_multikey then
	return
end

orgmode_multi_key.setup()
