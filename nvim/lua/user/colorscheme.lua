--vim.cmd [[
--try
 -- colorscheme darkplus
--catch /^Vim\%((\a\+)\)\=:E185/
 -- colorscheme default
  --set background=dark
--endtry
--]]
-- Nightfox colorschemes: 'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox'
local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local load_ok, nightfox = pcall(require, "nightfox")
if not load_ok then
  return
end

nightfox.setup{
  options = {
    transparent = true,
  },
}
