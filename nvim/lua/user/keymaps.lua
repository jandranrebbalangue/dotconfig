local opts = { noremap = true, silent = true }


local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n","<Up>","",opts)
keymap("n","<Down>","",opts)
keymap("n","<Left>","",opts)
keymap("n","<Right>","",opts)
--bufferline
-- keymap("n","<C-w>",":Bdelete<CR>",opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- copy from outside neovim to neovim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

--browse
local bookmarks = {
  ["github"] = {
      ["name"] = "search github from neovim",
      ["code_search"] = "https://github.com/search?q=%s&type=code",
      ["repo_search"] = "https://github.com/search?q=%s&type=repositories",
      ["issues_search"] = "https://github.com/search?q=%s&type=issues",
      ["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
  },
}

vim.keymap.set("n", "<leader>br", function()
  require("browse").browse({ bookmarks = bookmarks })
end)


-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Toggleterm
keymap("n", "<leader>t", ":ToggleTerm size=80 direction=vertical<cr>", opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false,}))<cr>",
  opts)
vim.keymap.set('n', '<leader>ec', "<cmd>Telescope find_files cwd=~/.config <cr>", { desc = '[E]dit Dot[C]onfig' })
vim.keymap.set('n', '<leader>en', "<cmd>Telescope find_files cwd=~/.config/nvim <cr>", { desc = '[E]dit [N]eovim config' })
keymap("n", "<leader>g", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<leader>m", "<cmd>Telescope media_files<cr>", opts)
-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", opts)


-- Navigate harpoon
keymap("n", "<A-a>", "<cmd> lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<A-t>", "<cmd> lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<A-1>", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<A-2>", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<A-3>", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<A-4>", "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<A-5>", " <cmd> lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<A-6>", "<cmd> lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<A-7>", "<cmd> lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<A-8>", "<cmd> lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<A-9>", "<cmd> lua require('harpoon.ui').nav_file(9)<cr>", opts)
keymap("n", "<A-0>", " <cmd> lua require('harpoon.ui').nav_file(0)<cr>", opts)
keymap("n", "<A-n>", "<cmd> lua require('harpoon.tmux').gotoTerminal(1)<cr>", opts)
keymap(
  "v",
  "<leader>q",
  ":lua require('refactoring').select_refactor()<CR>",
  { noremap = true, silent = true, expr = false }
)
--nomodoro
keymap('n', '<leader>w', '<cmd>NomoWork<cr>', opts)
keymap('n', '<leader>b', '<cmd>NomoBreak<cr>', opts)
keymap('n', '<leader>s', '<cmd>NomoStop<cr>', opts)

keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  { noremap = true, silent = true, expr = false })
keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  { noremap = true, silent = true, expr = false })
keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

vim.api.nvim_create_user_command(
    "DiffCommitLine",
    "lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
    { range = true }
)

vim.api.nvim_set_keymap(
    "v",
    "<leader>dcl",
    ":DiffCommitLine<CR>",
    { noremap = true }
)

--monorepo
vim.keymap.set("n", "<leader>m", function()
  require("telescope").extensions.monorepo.monorepo()
end)
keymap("n", "<leader>n","<cmd>lua require('monorepo').add_project()<cr>",opts)
--[[ vim.keymap.set("n", "<leader>n", function() ]]
--[[   require("monorepo").toggle_project() ]]
--[[ end) ]]

--icon picker
keymap("n","<C-n>","<cmd>IconPickerNormal<cr>",opts)
keymap("n","<C-p>","<cmd>IconPickerYank<cr>",opts)
keymap("i","<C-i>","<cmd>IconPickerInsert<cr>",opts)

keymap('n', '<leader>k', '<cmd>lua require("pretty_hover").hover()<cr>', opts)
