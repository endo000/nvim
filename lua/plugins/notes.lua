return {
  {
    "xolox/vim-notes",
    dependencies = {
      "xolox/vim-misc",
    },
    keys = {
      {
        "<leader>n",
        function()
          local date = os.date("%d_%m_%Y")

          vim.cmd(string.format("Note %s", date))

          local separator = "                                     * * *"
          vim.api.nvim_buf_set_lines(
            0,
            -1,
            -1,
            false,
            { separator, "", tostring(os.date("%H:%M:%S")), "", "•  Write here", "" }
          )
        end,
        desc = "Create note",
      },
    },
  },
}
