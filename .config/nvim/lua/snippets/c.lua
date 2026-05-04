local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

local function gen_int_snippets(sizes)
	local snippets = {}

	for _, size in ipairs(sizes) do
		-- unsigned
		table.insert(snippets,
			s("u" .. size, { t("uint" .. size .. "_t") })
		)

		-- signed
		table.insert(snippets,
			s("i" .. size, { t("int" .. size .. "_t") })
		)
	end

	return snippets
end

local snippets = gen_int_snippets({8, 16, 32, 64})

luasnip.add_snippets("c", snippets)
luasnip.filetype_extend("cpp", { "c" })
