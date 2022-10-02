local M = {}

function M.setup(config)
    config = config or {}
    require("ponderosa.config").setup(config)
end

function M.load()
    if vim.version().minor < 7 then
      vim.notify_once("ponderosa.nvim: you must use neovim 0.7 or higher")
      return
    end

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.cmd("set termguicolors")

    local theme = require("ponderosa.theme").load()
    local lush = require 'lush'
    local highlights = require 'ponderosa.highlights'(theme)
    local specs = require 'ponderosa.plugins'(highlights, theme)
    table.insert(specs, highlights)

    return lush.merge(specs)
end

return M
