-- default values for the setup
local status_ok, browse= pcall(require, "browse")
if not status_ok then
  return
end
local bookmarks = {
  ["github"] = {
      ["name"] = "search github from neovim",
      ["code_search"] = "https://github.com/search?q=%s&type=code",
      ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
      ["issues_search"] = "https://github.com/search?q=%s&type=issues",
      ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
  },
}
browse.setup({
  -- search provider you want to use
  provider = "duckduckgo", -- duckduckgo, bing
  -- either pass it here or just pass the table to the functions
  -- see below for more
  bookmarks = {bookmarks}
})


