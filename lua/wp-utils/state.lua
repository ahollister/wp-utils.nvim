local state = {}

state.cwd = vim.api.nvim_buf_get_name(0)
state.cwd_content = vim.api.nvim_exec("!ls $PWD", true)

return state
