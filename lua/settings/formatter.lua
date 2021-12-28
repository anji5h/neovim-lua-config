-- Autoformat on save
vim.api.nvim_exec(
  [[
        augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.cs,*.scss,*.css,*.html,*.js,*.json,*.jsx,*.lua,*.ts,*.tsx FormatWrite
        augroup END
    ]],
  true
)

-- Formatters
-- Lua
local luafmt = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

-- Prettier
local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

require("formatter").setup(
  {
    filetype = {
      css = {prettier},
      scss = {prettier},
      html = {prettier},
      javascript = {prettier},
      javascriptreact = {prettier},
      lua = {luafmt},
      typescript = {prettier},
      typescriptreact = {prettier},
      csharp = {prettier},
      json = {prettier},
      yaml = {prettier}
    }
  }
)
