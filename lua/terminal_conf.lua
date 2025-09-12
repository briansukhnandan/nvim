local terminals = {}

local function goto_term(n)
  -- Terminal exists at n → switch to it
  if terminals[n] and vim.api.nvim_buf_is_valid(terminals[n]) then
    vim.api.nvim_set_current_buf(terminals[n])
    vim.notify("Switched to terminal " .. n, vim.log.levels.INFO)
  else
    -- Create a new terminal
    vim.cmd("enew")
    vim.cmd("term")
    local buf = vim.api.nvim_get_current_buf()
    terminals[n] = buf

    -- Give terminal buffer pleasant name
    vim.api.nvim_buf_set_name(buf, "Terminal " .. n)
    vim.notify("Created terminal " .. n, vim.log.levels.INFO)
  end
end

-- <leader>+1 -> <leader>+9
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    function() goto_term(i) end,
    { desc = "Go to/create terminal " .. i }
  )
end
