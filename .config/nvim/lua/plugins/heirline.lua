local heirline = {
	"rebelot/heirline.nvim",
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"lewis6991/gitsigns.nvim",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		local Space = { provider = " " }
		local Spacer = { provider = "%=" }
		local Divider = { provider = " | " }

		local colors = {
			darkgray = "#16161d",
			black = "#000000",
			white = "#ffffff",
			-- gray = "#c0c0c0",
			innerbg = nil,
			outerbg = "#16161D",
			normal = "#ff0040",
			insert = "#88ff00",
			visual = "#ffdd00",
			replace = "#ff00ff",
			command = "#ff8800",
			terminal = "#00ffff",

			bright_bg = utils.get_highlight("Folded").bg,
			bright_fg = utils.get_highlight("Folded").fg,
			red = utils.get_highlight("DiagnosticError").fg,
			dark_red = utils.get_highlight("DiffDelete").bg,
			green = utils.get_highlight("String").fg,
			blue = utils.get_highlight("Function").fg,
			gray = utils.get_highlight("NonText").fg,
			orange = utils.get_highlight("Constant").fg,
			purple = utils.get_highlight("Statement").fg,
			cyan = utils.get_highlight("Special").fg,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
			-- git_del = utils.get_highlight("diffDeleted").fg,
			-- git_add = utils.get_highlight("diffAdded").fg,
			-- git_change = utils.get_highlight("diffChanged").fg,
			git_add = "#90ee90",
			-- git_change = '#fffaa0',
			-- git_del = '#ff8888',
			-- same as diags cause I like those better
			git_change = utils.get_highlight("DiagnosticWarn").fg,
			git_del = utils.get_highlight("DiagnosticError").fg,
		}

		heirline.load_colors(colors)
		local ViMode = {
			-- get vim current mode, this information will be required by the provider
			-- and the highlight functions, so we compute it only once per component
			-- evaluation and store it as a component attribute
			init = function(self)
				self.mode = vim.fn.mode(1) -- :h mode()
			end,
			-- Now we define some dictionaries to map the output of mode() to the
			-- corresponding string and color. We can put these into `static` to compute
			-- them at initialisation time.
			static = {
				mode_names = { -- change the strings if you like it vvvvverbose!
					n = "NORMAL",
					no = "N?",
					nov = "N?",
					noV = "N?",
					["no\22"] = "N?",
					niI = "Ni",
					niR = "Nr",
					niV = "Nv",
					nt = "Nt",
					v = "VISUAL",
					vs = "Vs",
					V = "V-LINE",
					Vs = "Vs",
					["\22"] = "^V",
					["\22s"] = "^V",
					s = "S",
					S = "S_",
					["\19"] = "^S",
					i = "INSERT",
					ic = "Ic",
					ix = "Ix",
					R = "REPLACE",
					Rc = "Rc",
					Rx = "Rx",
					Rv = "Rv",
					Rvc = "Rv",
					Rvx = "Rv",
					c = "COMMAND",
					cv = "Ex",
					r = "...",
					rm = "M",
					["r?"] = "?",
					["!"] = "!",
					t = "TERMINAL",
				},
			},
			-- We can now access the value of mode() that, by now, would have been
			-- computed by `init()` and use it to index our strings dictionary.
			-- note how `static` fields become just regular attributes once the
			-- component is instantiated.
			-- To be extra meticulous, we can also add some vim statusline syntax to
			-- control the padding and make sure our string is always at least 2
			-- characters long. Plus a nice Icon.
			provider = function(self)
				return " %2(" .. self.mode_names[self.mode] .. "%) "
			end,
			-- Same goes for the highlight. Now the foreground will change according to the current mode.
			hl = function(self)
				-- local mode = self.mode:sub(1, 1) -- get only the first mode character
				-- return { fg = mode_colors[mode], bold = true }
				local color = self:mode_color() -- here!
				return { fg = "black", bg = color, bold = true }
			end,
			-- Re-evaluate the component only on ModeChanged event!
			-- Also allows the statusline to be re-evaluated when entering operator-pending mode
			update = {
				"ModeChanged",
				pattern = "*:*",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},
		}

		-- local FileNameBlock = {
		-- 	-- let's first set up some attributes needed by this component and its children
		-- 	init = function(self)
		-- 		self.filename = vim.api.nvim_buf_get_name(0)
		-- 	end,
		-- }
		-- -- We can now define some children separately and add them later

		local FileIcon = {
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ":e")
				self.icon, self.icon_color =
					require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. " ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		-- local FileName = {
		-- 	provider = function(self)
		-- 		-- first, trim the pattern relative to the current directory. For other
		-- 		-- options, see :h filename-modifers
		-- 		local filename = vim.fn.fnamemodify(self.filename, ":t")
		-- 		if filename == "" then
		-- 			return "[No Name]"
		-- 		end
		-- 		-- now, if the filename would occupy more than 1/4th of the available
		-- 		-- space, we trim the file path to its initials
		-- 		-- See Flexible Components section below for dynamic truncation
		-- 		-- if not conditions.width_percent_below(#filename, 0.25) then
		-- 		-- 	filename = vim.fn.pathshorten(filename)
		-- 		-- end
		-- 		return " " .. filename
		-- 	end,
		-- 	-- hl = { fg = utils.get_highlight("Directory").fg },
		-- }

		-- local FileFlags = {
		-- 	{
		-- 		condition = function()
		-- 			return vim.bo.modified
		-- 		end,
		-- 		provider = "[+]",
		-- 		hl = { fg = "green" },
		-- 	},
		-- 	{
		-- 		condition = function()
		-- 			return not vim.bo.modifiable or vim.bo.readonly
		-- 		end,
		-- 		provider = "",
		-- 		hl = { fg = "orange" },
		-- 	},
		-- }

		-- Now, let's say that we want the filename color to change if the buffer is
		-- modified. Of course, we could do that directly using the FileName.hl field,
		-- but we'll see how easy it is to alter existing components using a "modifier"
		-- component

		-- local FileNameModifer = {
		-- 	hl = function()
		-- 		if vim.bo.modified then
		-- 			-- use `force` because we need to override the child's hl foreground
		-- 			return { bold = true, force = true }
		-- 		end
		-- 	end,
		-- }

		-- let's add the children to our FileNameBlock component
		-- FileNameBlock = utils.insert(
		-- 	FileNameBlock,
		-- 	-- FileIcon,
		-- 	utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
		-- 	FileFlags,
		-- 	{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
		-- )

		local Git = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= (0 and nil)
					or self.status_dict.removed ~= (0 and nil)
					or self.status_dict.changed ~= (0 and nil)
			end,

			hl = { bg = "darkgray" },

			{ -- git branch name
				{
					provider = function(self)
						return " " .. self.status_dict.head
					end,
					-- hl = { bold = true },
				},
				{
					condition = function(self)
						return self.has_changes
					end,
					Divider,
				},
				{
					condition = function(self)
						return not self.has_changes
					end,
					provider = " ",
				},
			},
			-- You could handle delimiters, icons and counts similar to Diagnostics
			{
				provider = function(self)
					local added = self.status_dict.added or 0
					return added > 0 and ("+" .. added)
				end,
				hl = { fg = "git_add" },
			},
			{
				provider = function(self)
					local changed = self.status_dict.changed or 0
					local added = self.status_dict.added or 0
					return changed > 0 and (added > 0 and " ~" .. changed or "~" .. changed)
				end,
				hl = { fg = "git_change" },
			},
			{
				provider = function(self)
					local removed = self.status_dict.removed or 0
					local changed = self.status_dict.changed or 0
					local added = self.status_dict.added or 0
					return removed > 0 and ((added > 0 or changed > 0) and " -" .. removed or "-" .. removed)
				end,
				hl = { fg = "git_del" },
			},
			{
				condition = function(self)
					return self.has_changes
				end,
				provider = " ",
				-- Divider,
			},
		}

		local Diagnostics = {

			condition = conditions.has_diagnostics,

			static = {
				error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
				warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
				info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
				hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
			},

			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,

			update = { "DiagnosticChanged", "BufEnter" },

			{
				provider = function(self)
					-- 0 is just another output, we can decide to print it or not!
					return self.errors > 0 and (self.error_icon .. self.errors .. " ")
				end,
				hl = { fg = "diag_error" },
			},
			{
				provider = function(self)
					return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
				end,
				hl = { fg = "diag_warn" },
			},
			{
				provider = function(self)
					return self.info > 0 and (self.info_icon .. self.info .. " ")
				end,
				hl = { fg = "diag_info" },
			},
			{
				provider = function(self)
					return self.hints > 0 and (self.hint_icon .. self.hints)
				end,
				hl = { fg = "diag_hint" },
			},
			Divider,
		}

		local Ruler = {
			-- %l = current line number
			-- %L = number of lines in the buffer
			-- %c = column number
			-- %P = percentage through file of displayed window
			{
				-- provider = " %P ",
				provider = function()
					local current_line = vim.fn.line(".")
					local total_lines = vim.fn.line("$")
					if total_lines > 0 then
						if current_line == 1 then
							return " Top "
						elseif current_line == total_lines then
							return " Bot "
						else
							local cursor_percentage = math.floor(current_line * 100 / total_lines)
							return " " .. tostring(cursor_percentage) .. "%% "
						end
					end
					return ""
				end,
				hl = function(self)
					-- local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
					local color = self:mode_color() -- here!
					return { bg = "darkgray", fg = color, bold = true }
				end,
			},
			{
				provider = " %3(%l:%c%) ",
				hl = function(self)
					-- local mode = vim.fn.mode(1):sub(1, 1) -- get only the first mode character
					local color = self:mode_color() -- here!
					return { fg = "black", bg = color, bold = true }
				end,
			},
		}
		local LSPActive = {
			condition = conditions.lsp_attached,
			update = { "LspAttach", "LspDetach" },

			-- You can keep it simple,
			-- provider = " [LSP]",

			-- Or complicate things a bit and get the servers names
			{
				provider = function()
					local names = {}
					for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
						table.insert(names, server.name)
					end
					return " [" .. table.concat(names, " ") .. "]"
				end,
				hl = { fg = "green", bold = true },
			},
			{ -- separated so it doesn't go green
				Divider,
			},
		}

		local FileSize = {
			provider = function()
				-- stackoverflow, compute human readable file size
				local suffix = { "b", "k", "M", "G", "T", "P", "E" }
				local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
				fsize = (fsize < 0 and 0) or fsize
				if fsize < 1024 then
					return fsize .. suffix[1]
				end
				local i = math.floor((math.log(fsize) / math.log(1024)))
				return string.format("%.2f%s", fsize / (1024 ^ i), suffix[i + 1])
			end,
			condition = function()
				local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
				return fsize > 0
			end,
			Divider,
		}

		-- local FileLastModified = {
		-- 	-- did you know? Vim is full of functions!
		-- 	provider = function()
		-- 		local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
		-- 		return (ftime > 0) and os.date("%c", ftime)
		-- 	end,
		-- }

		local FileType = {
			provider = function()
				return vim.bo.filetype
			end,
			hl = { fg = utils.get_highlight("Type").fg, bold = true },
		}

		local FileEncoding = {
			provider = function()
				local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
				return enc ~= "utf-8" and enc:upper() or enc
			end,
			Divider,
		}

		local formatIcons = {
			unix = "",
			dos = "",
			mac = "",
		}
		local FileFormat = {
			provider = function()
				local fmt = vim.bo.fileformat
				return fmt ~= "unix" and fmt:upper() or formatIcons[fmt]
			end,
			-- Space,
			Divider,
		}

		local FileInfoBlock = {
			-- let's first set up some attributes needed by this component and its children
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}
		FileInfoBlock = utils.insert(FileInfoBlock, FileSize, FileEncoding, FileFormat, FileIcon, FileType, Space)

		-- this is the default function used to retrieve buffers
		local get_bufs = function()
			return vim.tbl_filter(function(bufnr)
				return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
			end, vim.api.nvim_list_bufs())
		end

		-- initialize the buflist cache
		local buflist_cache = {}

		-- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
		vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					local buffers = get_bufs()
					for i, v in ipairs(buffers) do
						buflist_cache[i] = v
					end
					for i = #buffers + 1, #buflist_cache do
						buflist_cache[i] = nil
					end

					-- check how many buffers we have and set showtabline accordingly
					-- if #buflist_cache > 1 then
					-- 	vim.o.showtabline = 2 -- always
					-- elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
					-- 	vim.o.showtabline = 1 -- only when #tabpages > 1
					-- end
				end)
			end,
		})

		local BufferlineBufnr = {
			provider = function(self)
				return " " .. tostring(self.bufnr) .. " "
			end,
			hl = function(self)
				local bg = self.is_active and "darkgray" or nil
				local fg = not self.is_active and "gray" or nil
				return { fg = fg, bg = bg, bold = self.is_active or self.is_visible, italic = true }
			end,
		}

		-- we redefine the filename component, as we probably only want the tail and not the relative path
		-- TODO could move the modified stuff here from flags maybe
		local BufferlineFileName = {
			provider = function(self)
				-- self.filename will be defined later, just keep looking at the example!
				local filename = self.filename
				filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")

				local mod = vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
				if mod then
					return filename
				else
					return filename .. " "
				end
			end,
			hl = function(self)
				local bg = self.is_active and "darkgray" or nil
				local fg = not self.is_active and "gray" or nil
				return { fg = fg, bg = bg, bold = self.is_active or self.is_visible, italic = true }
			end,
		}

		-- this looks exactly like the FileFlags component that we saw in
		-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
		-- also, we are adding a nice icon for terminal buffers.
		local BufferlineFileFlags = {
			{
				condition = function(self)
					return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
				end,
				provider = "[+] ",
				hl = function(self)
					local bg = self.is_active and "darkgray" or nil
					return { bg = bg, fg = "green" }
				end,
			},
			{
				condition = function(self)
					return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
						or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
				end,
				provider = function(self)
					if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
						return "  "
					else
						return ""
					end
				end,
				hl = { fg = "orange" },
			},
		}

		-- Here the filename block finally comes together
		local BufferlineFileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(self.bufnr)
			end,
			-- hl = function(self)
			-- 	if self.is_active then
			-- 		return "TabLineSel"
			-- 		-- why not?
			-- 		-- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
			-- 		--     return { fg = "gray" }
			-- 	else
			-- 		return "TabLine"
			-- 	end
			-- end,
			on_click = {
				callback = function(_, minwid, _, button)
					if button == "m" then -- close on mouse middle click
						vim.schedule(function()
							vim.api.nvim_buf_delete(minwid, { force = false })
						end)
					else
						vim.api.nvim_win_set_buf(0, minwid)
					end
				end,
				minwid = function(self)
					return self.bufnr
				end,
				name = "heirline_tabline_buffer_callback",
			},
			BufferlineBufnr,
			BufferlineFileName,
			BufferlineFileFlags,
		}

		local BufferLine = utils.make_buflist(
			-- BufferlineBufferBlock,
			BufferlineFileNameBlock,
			{ provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
			{ provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
			-- by the way, open a lot of buffers and try clicking them ;)
		)

		local Left = {
			ViMode,
			Git,
			BufferLine,
		}
		local Right = {
			Diagnostics,
			-- LSPActive,
			FileInfoBlock,
			Ruler,
		}

		local Statusline = {
			static = {
				mode_colors_map = {
					n = colors.normal,
					i = colors.insert,
					v = colors.visual,
					V = colors.visual,
					["\22"] = "cyan",
					c = colors.command,
					s = "purple",
					S = "purple",
					["\19"] = "purple",
					R = colors.replace,
					r = "orange",
					["!"] = "blue",
					t = colors.terminal,
				},
				mode_color = function(self)
					local mode = conditions.is_active() and vim.fn.mode() or "n"
					return self.mode_colors_map[mode]
				end,
			},
			{
				flexible = 1,
				Left,
			},
			{
				flexible = 2,
				Spacer,
			},
			{
				flexible = 1,
				Right,
			},
		}

		vim.opt.laststatus = 3 -- global statusline
        vim.opt.showmode = false -- mode shown only by heirline, aka no more -- INSERT --
		heirline.setup({
			statusline = Statusline,
		})
	end,
}

return heirline
