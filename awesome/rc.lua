-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
-- local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- local lain = require("lain")
-- local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
-- local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.font = "SF Mono 10"
beautiful.wallpaper = "/home/bozo/.dotfiles/res/wallpaper.jpg"
-- gears.wallpaper = "$HOME/.dotfiles/res/wallpaper.jpg"
beautiful.border_width = 1
beautiful.bg_focus = "#7E9CD8"
beautiful.fg_normal = "#ddd"
beautiful.taglist_squares_sel = nil
beautiful.taglist_squares_unsel = nil
beautiful.taglist_bg_occupied = "#373B41"
beautiful.tasklist_disable_icon = true
beautiful.systray_icon_spacing = 10

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	-- awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mymainmenu =
	awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon }, { "open terminal", terminal } } })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget

mytextclock = wibox.widget.textclock("%H:%M ", 1)

mytextclock:connect_signal("button::press", function(self, _, _, b)
	self.format = self.format == "%H:%M " and "%a, %b %d, %H:%M:%S " or "%H:%M "
end)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, false)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ " 1 ", " 2 ", " 3 ", " 4 " }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	local theme = {}
	theme.layout_txt_tile = "[]="
	theme.layout_txt_tileleft = "[l]"
	theme.layout_txt_tilebottom = "[b]"
	theme.layout_txt_tiletop = "[tt]"
	theme.layout_txt_fairv = "[fv]"
	theme.layout_txt_fairh = "[fh]"
	theme.layout_txt_spiral = "[s]"
	theme.layout_txt_dwindle = "[d]"
	theme.layout_txt_max = "[+]"
	theme.layout_txt_fullscreen = "[F]"
	theme.layout_txt_magnifier = "[m]"
	theme.layout_txt_floating = "><>"

	-- Textual layoutbox
	local function update_txt_layoutbox(s)
		-- Writes a string representation of the current layout in a textbox widget
		local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
		s.mytxtlayoutbox:set_text(txt_l)
	end

	s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
	awful.tag.attached_connect_signal(s, "property::selected", function()
		update_txt_layoutbox(s)
	end)
	awful.tag.attached_connect_signal(s, "property::layout", function()
		update_txt_layoutbox(s)
	end)
	s.mytxtlayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		squares_resize = true,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	tbox_separator = wibox.widget.textbox(" / ")
	-- local mybattery = lain.widget.bat({
	-- 	settings = function()
	-- 		widget:set_markup(lain.util.markup(beautiful.fg_normal, " " .. bat_now.perc .. "% "))
	-- 	end,
	-- })

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 25, fg_focus = "#ff8000" })
	local systray = wibox.widget.systray()
	systray.forced_height = 10
	local systray_margin = wibox.container.margin()
	systray_margin.top = 3
	systray_margin.bottom = 3
	systray_margin.left = 10
	systray_margin:set_widget(systray)

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			spacing = 10,
			-- mylauncher,
			s.mytaglist,
			s.mytxtlayoutbox,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			spacing = 5,
			systray_margin,
			tbox_separator,
			mykeyboardlayout,
			tbox_separator,
			require("battery-widget")({
				ac = "AC",
				adapter = "BAT0",
				ac_prefix = "+ ",
				battery_prefix = "- ",
				percent_colors = {
					{ 10, "red" },
					{ 50, beautiful.fg_normal },
					{ 999, beautiful.fg_normal },
				},
				listen = true,
				timeout = 10,
				widget_text = "${AC_BAT}${color_on}${percent}%${color_off}",
				widget_font = beautiful.font,
				tooltip_text = "Battery ${state}${time_est}\nCapacity: ${capacity_percent}%",
				alert_threshold = 5,
				alert_timeout = 0,
				alert_title = "Low battery !",
				alert_text = "${AC_BAT}${time_est}",
				warn_full_battery = false,
			}),
			tbox_separator,
			mytextclock,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey, "Control" }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	-- awful.key({ modkey }, "[", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	-- awful.key({ modkey }, "]", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/changebrightness.sh -inc 5")
	end, { description = "increase brightness", group = "custom" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/changebrightness.sh -dec 5")
	end, { description = "decrease brightness", group = "custom" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/changevolume.sh 5%+")
	end),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/changevolume.sh 5%-")
	end),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/changevolume.sh toggle")
	end),

	awful.key({}, "XF86AudioMicMute", function()
		awful.spawn.with_shell("~/.dotfiles/dunst/scripts/mutemic.sh toggle")
	end),

	awful.key({ modkey, "Control" }, "x", function(c)
		c.maximized_horizontal = false
		c.maximized_vertical = false
	end),

	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	-- awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
	--           {description = "show main menu", group = "awesome"}),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey }, "o", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "t", function()
		awful.layout.set(awful.layout.suit.tile)
	end, { description = "set layout to tile", group = "layout" }),
	awful.key({ modkey }, "f", function()
		awful.layout.set(awful.layout.suit.max.fullscreen)
	end, { description = "set layout to fullscreen", group = "layout" }),
	awful.key({ modkey }, "s", function()
		awful.layout.set(awful.layout.suit.floating)
	end, { description = "set layout to floating", group = "layout" }),
	awful.key({ modkey }, "m", function()
		awful.layout.set(awful.layout.suit.max)
	end, { description = "set layout to max", group = "layout" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "e", function()
		awful.spawn("emacs", false)
	end, { description = "open emacs", group = "launcher" }),
	awful.key({ modkey }, "w", function()
		awful.spawn("firefox", false)
	end, { description = "open firefox", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ "Control" }, "space", function()
		awful.spawn.with_shell("setxkbmap -layout us,hu -variant ,qwerty -option grp:win_space_toggle caps:swapescape")
		awful.spawn.with_shell("xset r rate 350 50")
	end, { description = "reset keyboard settings", group = "awesome" }),
	awful.key(
		{ modkey, "Shift" },
		"s", function()
		awful.spawn.with_shell("flameshot gui") end,
		{ description = "screenshot", group = "client" }
	),

	-- awful.key({ modkey }, "l", function()
	-- 	awful.tag.incmwfact(0.05)
	-- end, { description = "increase master width factor", group = "layout" }),
	-- awful.key({ modkey }, "h", function()
	-- 	awful.tag.incmwfact(-0.05)
	-- end, { description = "decrease master width factor", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "h", function()
	-- 	awful.tag.incnmaster(1, nil, true)
	-- end, { description = "increase the number of master clients", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "l", function()
	-- 	awful.tag.incnmaster(-1, nil, true)
	-- end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	-- awful.key({ modkey }, "space", function()
	-- 	awful.layout.inc(1)
	-- end, { description = "select next", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "space", function()
	-- 	awful.layout.inc(-1)
	-- end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	-- Menubar
	awful.key({ modkey, "Shift" }, "r", function()
		awful.spawn.with_shell('dmenu_run -h 25 -sb "#7E9CD8" -fn "JetBrains Mono-10" -i -dim 0.4')
	end, { description = "open dmenu_run", group = "launcher" })
)

clientkeys = gears.table.join(
	awful.key({ modkey, "Shift" }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey }, "BackSpace", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	-- awful.key(
	-- 	{ modkey, "Shift" },
	-- 	"s",
	-- 	awful.client.floating.toggle,
	-- 	{ description = "toggle floating", group = "client" }
	-- ),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey, "Shift" }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	-- awful.key({ modkey }, "t", function(c)
	-- 	c.ontop = not c.ontop
	-- end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" })
	-- awful.key({ modkey, "Shift" }, "m", function(c)
	-- 	c.maximized_horizontal = not c.maximized_horizontal
	-- 	c:raise()
	-- end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end

			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" }),

		-- awful.key({ modkey, "Shift" }, "]", function()
		-- 	local screen = awful.screen.focused()
		-- 	local t = screen.selected_tag
		-- 	if t then
		-- 		local idx = t.index + 1
		-- 		if idx > #screen.tags then
		-- 			idx = 1
		-- 		end
		-- 		if client.focus then
		-- 			client.focus:move_to_tag(screen.tags[idx])
		-- 			screen.tags[idx]:view_only()
		-- 		end
		-- 	end
		-- end, { description = "move focused client to next tag and view tag", group = "tag" }),

		awful.key({ modkey, "Shift" }, "l", function()
			local screen = awful.screen.focused()
			local t = screen.selected_tag
			if t then
				local idx = t.index + 1
				if idx > #screen.tags then
					idx = 1
				end
				if client.focus then
					client.focus:move_to_tag(screen.tags[idx])
					screen.tags[idx]:view_only()
				end
			end
		end, { description = "move focused client to next tag and view tag", group = "tag" }),

		-- awful.key({ modkey, "Shift" }, "[", function()
		-- 	local screen = awful.screen.focused()
		-- 	local t = screen.selected_tag
		-- 	if t then
		-- 		local idx = t.index - 1
		-- 		if idx == 0 then
		-- 			idx = #screen.tags
		-- 		end
		-- 		if client.focus then
		-- 			client.focus:move_to_tag(screen.tags[idx])
		-- 			screen.tags[idx]:view_only()
		-- 		end
		-- 	end
		-- end, { description = "move focused client to previous tag and view tag", group = "tag" }),

		awful.key({ modkey, "Shift" }, "h", function()
			local screen = awful.screen.focused()
			local t = screen.selected_tag
			if t then
				local idx = t.index - 1
				if idx == 0 then
					idx = #screen.tags
				end
				if client.focus then
					client.focus:move_to_tag(screen.tags[idx])
					screen.tags[idx]:view_only()
				end
			end
		end, { description = "move focused client to previous tag and view tag", group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.focused,
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
				"megasync",
				"blueberry",
				"pavucontrol",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Spawn floating clients centered
	{ rule_any = { floating = true }, properties = {
		placement = awful.placement.centered,
	} },

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("request::manage", function(c)
	-- Center dialogs over parent
	if c.transient_for then
		awful.placement.centered(c, {
			parent = c.transient_for,
		})
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- }}}

awful.spawn.with_shell(
	'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
		.. 'xrdb -merge <<< "awesome.started:true";'
		-- list each of your autostart commands, followed by ; inside single quotes, followed by ..
		.. "autorandr -c;"
		.. "libinput-gestures-setup start;"
		.. 'xinput --set-prop 9 "libinput Accel Speed" -0.4;'
		.. "picom & disown;"
		.. "ksuperkey -e 'Super_L=Super_L|Shift_L|r';"
		.. "dunst & disown;"
		.. "betterlockscreen -u $HOME/.dotfiles/res/wallpaper.jpg --fx dim,blur;"
		.. "bluetoothctl power on;"
		.. "nm-applet & disown;"
		.. "blueman-applet & disown;"
		.. "dropbox & disown;"
		.. 'if ! pgrep -x "megasync" > /dev/null; then; megasync & disown; fi;'
)

awful.spawn.with_shell("setxkbmap -layout us,hu -variant ,qwerty -option grp:win_space_toggle caps:swapescape")
awful.spawn.with_shell("xset r rate 350 50")
