local state = {}

local function removeCharactersUntilSlash(inputString)
	local index = inputString:find("/")
	if index == 1 then
		return inputString:sub(index)
	else
		return "/" .. inputString:sub(index + 1)
	end
end

state.cwd = removeCharactersUntilSlash(vim.api.nvim_buf_get_name(0))
state.cwd_content = vim.api.nvim_exec("!ls $PWD", true)

return state
