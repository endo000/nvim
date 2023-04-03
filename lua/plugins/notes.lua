return {
  {
    "xolox/vim-notes",
    dependencies = {
      "xolox/vim-misc",
    },
    config = function()
      vim.g["notes_directories"] = { "C:/dev/notes" }
      vim.g["notes_shadowdir"] = "C:/dev/notes/shadow"
    end,
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
