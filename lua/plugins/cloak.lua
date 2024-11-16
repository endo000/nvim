return {
  "laytan/cloak.nvim",
  opts = {
    enabled = true,
    patterns = {
      {
        file_pattern = ".env*",
        cloak_pattern = "=.+",
        replace = nil,
      },
      {
        file_pattern = "*.txt",
        cloak_pattern = ':.+',
      },
    },
  },
}
