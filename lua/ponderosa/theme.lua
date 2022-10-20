M = {}

M.themes = {
    "default",
    "faded",
    "terra",
    "autumn"
}

---Get the name of the theme to load
---@param theme function|string
---@return string
local function get_theme(theme)
    if type(theme) == "function" then
        theme = theme()
    end

    if vim.tbl_contains(M.themes, theme) then
        return theme
    end

    return "default"
end

---Load a theme and apply user overrides
---@param theme string (optional)
---@return table
function M.load(theme)
    theme = get_theme(theme or require("ponderosa.config").config.theme)
    local theme_table
    if theme == "default" then
        theme_table = require 'ponderosa.colors.default'()
    elseif theme == "faded" then
        theme_table = require 'ponderosa.colors.faded'()
    elseif theme == "terra" then
        theme_table = require 'ponderosa.colors.terra'()
    elseif theme == "autumn" then
        theme_table = require 'ponderosa.colors.autumn'()
    end

    return theme_table
end

return M
