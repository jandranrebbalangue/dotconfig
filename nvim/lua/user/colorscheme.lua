-- Nightfox colorschemes: 'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox'
--[[ local colorscheme = "nightfox" ]]

local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
local mocha = require("catppuccin.palettes").get_palette("mocha")
local M = {}
local ok_status, catppuccin= pcall(require, "catppuccin")

if not ok_status then
  return
end

M.overrides = {
  colors = {},
  highlights = {
    all = {
      CmpItemAbbrMatch = { fg = mocha.blue },
      CmpItemAbbrMatchFuzzy = { fg = mocha.blue },
		  Pmenu = { bg = mocha.crust },
		  PmenuSel = { fg = mocha.sapphire },
		  PmenuSbar = { bg = mocha.base }, -- Popup menu: scrollbar.
		  PmenuThumb = { bg = mocha.surface0 }, -- Popup menu: Thumb of the scrollbar.
      VertSplit = { fg = mocha.surface0 },
      NonText = { fg = mocha.surface0 },
    }
    -- mocha = {
    --   ["@field"] = { fg = mocha.rosewater },
    --   TSField = { fg = mocha.rosewater },
    -- }
  }
}

function M.setup()
  catppuccin.setup({
    transparent_background = true,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = { "italic" },
      strings = {},
      variables = { "italic" },
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = true,
      cmp = true,
      gitgutter = true,
      gitsigns = true,
      lsp_trouble = true,
      neogit = true,
      symbols_outline = true,
      telescope = true,
      nvimtree = true, --false? neotree
      dashboard = false,
      markdown = true,
      notify = true,
      noice = true,
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dap = {
        enabled = true,
        enabled_ui = true,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      }
    },
    color_overrides = M.overrides.colors,
    highlight_overrides = M.overrides.highlights,
  })
end

return M
--[[ local load_ok, nightfox = pcall(require, "nightfox") ]]
--[[ if not load_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ nightfox.setup{ ]]
--[[   options = { ]]
--[[     transparent = true, ]]
--[[   }, ]]
--[[ } ]]

