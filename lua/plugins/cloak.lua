return {
  "laytan/cloak.nvim",
  opts = {
    enabled = true,
    patterns = {
      {
        file_pattern = "*.txt",
        cloak_pattern = ':.+',
      },
    },
  },
}
