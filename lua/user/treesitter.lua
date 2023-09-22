-- local status, autotag = pcall(require, "nvim-ts-autotag")
-- if not status then
-- 	return
-- end
--
-- autotag.setup({})

local status, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end
treesitter_config.setup({
  ensure_installed = { "c", "python", "rust", "typescript", "cmake" },
  autotag = { enable = true },
  sync_install = false,
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  auto_install = true,

  highlight = {
    enable = true,

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
