local M = {}

local defaults = {
    dark_theme = "default",
    theme = function()
        if vim.o.background == "dark" then
            return M.config.dark_theme
        else
            return "NOT IMPLEMENTED"
        end
    end,
    plugins = {

    }
}

M.config = vim.deepcopy(defaults)

function M.setup(config)
    config = config or {}
    M.config = vim.tbl_deep_extend("force", defaults, config)
end

return M
