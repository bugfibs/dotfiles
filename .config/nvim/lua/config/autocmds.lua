-- Autocommands

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Auto-compile and run Java files on save
-- Compiles all .java files in the current file's directory, then runs `java Main`
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.java",
  group = vim.api.nvim_create_augroup("java-autorun", { clear = true }),
  callback = function()
    local file_dir = vim.fn.expand("%:p:h")
    local cd_cmd = "cd " .. vim.fn.shellescape(file_dir)

    local compile_output = vim.fn.system(cd_cmd .. " && javac *.java 2>&1")
    if vim.v.shell_error ~= 0 then
      print("Compile error: " .. compile_output)
      return
    end

    local result = vim.fn.system(cd_cmd .. " && java Main 2>&1")
    print(result)
  end,
})
