vim.g['notes_directories'] = { 'C:/dev/notes' }
vim.g['notes_shadowdir'] = 'C:/dev/notes/shadow'

function _G.note()
    local date = os.date('%d_%m_%Y')

    vim.cmd(string.format('Note %s', date))

    local separator = '                                     * * *'
    vim.api.nvim_buf_set_lines(0, -1, -1, false, { separator, '', os.date('%H:%M:%S'), '', '•  Write here', '' })
end

local wk = require('which-key')
wk.register({
    n = {
        note, 'Create note',
    },
}, { prefix = '<leader>' })
