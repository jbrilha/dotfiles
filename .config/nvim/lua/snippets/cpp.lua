local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets("cpp", {
	s("coe", {
		t("std::cout << "),
		    i(1, "msg"),
		t(" << std::endl;"),
	}),
})
