local wk = require('which-key')
wk.register({
    t = {
        name = 'NERDTree',
        f = { '<cmd>NERDTreeFocusToggle<CR>', 'Focus NERDTree' },
        t = { '<cmd>NERDTreeTabsToggle<CR>', 'Toggle NERDTree' },
    },
}, { prefix = '<leader>' })
