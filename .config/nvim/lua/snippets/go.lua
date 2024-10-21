local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

luasnip.add_snippets("go", {
	s("ee", {
		t({ "if err != nil {",
                "\treturn err",
            "}"
        }),
	}),
})
