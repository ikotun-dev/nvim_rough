local M = {}
local api = vim.api

-- Helper function to check if we're in a git repo
local function is_git_repo()
  local cmd = "git rev-parse --is-inside-work-tree"
  local handle = io.popen(cmd)
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:match("true")
  end
  return false
end

-- Helper function to check if file is tracked by git
local function is_file_tracked()
  local currFile = vim.fn.expand("%:p")
  local cmd = string.format("git ls-files --error-unmatch %s", currFile)
  local handle = io.popen(cmd)
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end
  return false
end

function M.blameVirtText()
  -- Early returns for invalid conditions
  local ft = vim.fn.expand("%:h:t")
  if ft == "" or ft == "bin" then
    return
  end

  -- Check if we're in a git repo and file is tracked
  if not is_git_repo() or not is_file_tracked() then
    return
  end

  -- Clear existing virtual text
  api.nvim_buf_clear_namespace(0, 2, 0, -1)

  -- Get current file and line
  local currFile = vim.fn.expand("%:p") -- Use full path
  local line = api.nvim_win_get_cursor(0)

  -- Get blame information
  local blame = vim.fn.system(string.format("git blame -c -L %d,%d %s", line[1], line[1], currFile))
  if vim.v.shell_error ~= 0 then
    return
  end

  local hash = vim.split(blame, "%s")[1]
  if not hash then
    return
  end

  local text
  if hash == "00000000" then
    text = "Not Committed Yet"
  else
    local cmd = string.format("git show %s ", hash) .. "--format='%an | %ar | %s'"
    text = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      text = "Not Committed Yet"
    else
      text = vim.split(text, "\n")[1]
      if text:find("fatal") then
        text = "Not Committed Yet"
      end
    end
  end

  -- Set virtual text
  api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, { { text, "GitLens" } }, {})
end

function M.clearBlameVirtText()
  api.nvim_buf_clear_namespace(0, 2, 0, -1)
end

-- Optional: Add setup function
function M.setup(opts)
  -- Create highlight group if it doesn't exist
  vim.cmd([[
        highlight default link GitLens Comment
    ]])

  -- Set up autocommands
  local group = api.nvim_create_augroup("GitLens", { clear = true })
  api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = group,
    callback = M.blameVirtText,
  })
  api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = group,
    callback = M.clearBlameVirtText,
  })
end

return M
