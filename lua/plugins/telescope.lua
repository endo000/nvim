return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { "%.git/", "node_modules/", ".next/" },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
      live_grep = {
        additional_args = function()
          return {
            "--hidden",
            "--no-ignore",
            "--max-filesize",
            "1M",
            "--binary",
          }
        end,
      },
    },
  },
}
