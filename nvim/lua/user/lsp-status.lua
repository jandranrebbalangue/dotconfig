local lsp_status = pcall(require, "lsp-status")
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind 
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }
-- Put this somewhere near lsp_status.register_progress()
  -- lsp_status.config({
  --   indicator_errors = 'E',
  --   indicator_warnings = 'W',
  --   indicator_info = 'i',
  --   indicator_hint = '?',
  --   indicator_ok = 'Ok',
  -- })
-- Register the progress handler
lsp_status.register_progress()
