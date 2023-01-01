-- Fork of
-- https://github.com/nvim-telescope/telescope.nvim/blob/a606bd10c79ec5989c76c49cc6f736e88b63f0da/lua/telescope/actions/history.lua
-- to support per-picker history.

local histories = require("telescope.actions.history")
local Path = require("plenary.path")
local uv = vim.loop

local write_async = function(path, txt, flag)
  uv.fs_open(path, flag, 438, function(open_err, fd)
    assert(not open_err, open_err)
    uv.fs_write(fd, txt, -1, function(write_err)
      assert(not write_err, write_err)
      uv.fs_close(fd, function(close_err)
        assert(not close_err, close_err)
      end)
    end)
  end)
end

local append_async = function(path, txt)
  write_async(path, txt, "a")
end

local start_history = function(self, picker)
  if self._picker_path == nil then
    self._picker_path = Path:new(self.path, picker.prompt_title)
    if not self._picker_path:exists() then
      self._picker_path:touch({ parents = true })
    end
    self.content = self._picker_path:readlines()
    self.index = #self.content
    table.remove(self.content, self.index)
  end
end

return function()
  return histories.new({
    init = function(obj)
      obj.content = {}
      obj.index = 1
      obj._picker_path = nil
    end,
    reset = function(self)
      self.content = {}
      self.index = 1
      self._picker_path = nil
    end,
    append = function(self, line, picker, no_reset)
      start_history(self, picker)
      if line ~= "" then
        if self.content[#self.content] ~= line then
          table.insert(self.content, line)

          local len = #self.content
          if self.limit and len > self.limit then
            local diff = len - self.limit
            for i = diff, 1, -1 do
              table.remove(self.content, i)
            end
            write_async(self._picker_path.filename, table.concat(self.content, "\n") .. "\n", "w")
          else
            append_async(self._picker_path.filename, line .. "\n")
          end
        end
      end
      if not no_reset then
        self:reset()
      end
    end,
    pre_get = function(self, _, picker)
      start_history(self, picker)
    end,
  })
end
