require('telescope').setup {
    defaults = {
        file_ignore_patterns = { '.fvm', '.dart_tool', '.git', 'android', 'ios', 'build', '.idea', 'assets', '%.meta' }
    }
}

local builtin = require('telescope.builtin')
local wk = require('which-key')
wk.register({
  f = {
    name = 'Telescope',
    f = {builtin.find_files, 'Find File' },
    g = {builtin.live_grep, 'Live grep' },
    b = {builtin.buffers, 'Buffers' },
    h = {builtin.help_tags, 'Help tags' },
  },
}, { prefix = '<leader>' })
