local M = {}

local function is_dark_macos()
	local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
	return result:match("Dark") ~= nil
end

local function is_dark_linux()
	-- TODO
	return true
end

function M.is_dark_mode()
	if vim.fn.has("mac") == 1 then
		return is_dark_macos()
	elseif vim.fn.has("unix") == 1 then
		return is_dark_linux()
	end
	return true
end

return M
