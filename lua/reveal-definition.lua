local M = {}

function M.reveal_definition(get_references)
  vim.lsp.buf.definition({
    on_list = function(opts)
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local cur_filename = vim.api.nvim_buf_get_name(0)
      local first = opts.items[1]
      local range = first.user_data.targetSelectionRange
      local start_col = range.start.character
      local end_col = range['end'].character
      if cur_filename == first.filename and row == first.lnum and col >= start_col and col < end_col then
        get_references()
      else
        vim.fn.setqflist({}, ' ', opts)
        vim.cmd.cfirst()
      end
    end
  })
end

return M
