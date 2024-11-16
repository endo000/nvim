vim.opt.conceallevel = 2

return {
  "epwalsh/obsidian.nvim",
  event = { "BufReadPre  */obsidian/*.md" },
  opts = {
    dir = vim.env.HOME .. "/dev/obsidian",

    templates = {
      folder = "templates/builtin",
      date_format = "%Y-%m-%d %H:%M",
      time_format = "%H:%M",
    },

    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then note:add_alias(note.title) end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
  },
}
