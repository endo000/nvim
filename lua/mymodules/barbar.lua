require('barbar').setup {}

local wk = require('which-key')
wk.register({
    -- Move to previous/next
    ['<A-,>'] = { '<Cmd>BufferPrevious<CR>', 'Previous tab' },
    ['<A-.>'] = { '<Cmd>BufferNext<CR>', 'Next tab' },
    -- Re-order to previous/next
    ['<A-<>'] = { '<Cmd>BufferMovePrevious<CR>', 'Move to previous tab' },
    ['<A->>'] = { '<Cmd>BufferMoveNext<CR>', 'Move to next tab' },
    -- Goto buffer in position...
    ['<A-1>'] = { '<Cmd>BufferGoto 1<CR>', 'Goto 1' },
    ['<A-2>'] = { '<Cmd>BufferGoto 2<CR>', 'Goto 2' },
    ['<A-3>'] = { '<Cmd>BufferGoto 3<CR>', 'Goto 3' },
    ['<A-4>'] = { '<Cmd>BufferGoto 4<CR>', 'Goto 4' },
    ['<A-5>'] = { '<Cmd>BufferGoto 5<CR>', 'Goto 5' },
    ['<A-6>'] = { '<Cmd>BufferGoto 6<CR>', 'Goto 6' },
    ['<A-7>'] = { '<Cmd>BufferGoto 7<CR>', 'Goto 6' },
    ['<A-8>'] = { '<Cmd>BufferGoto 8<CR>', 'Goto 7' },
    ['<A-9>'] = { '<Cmd>BufferGoto 9<CR>', 'Goto 9' },
    ['<A-0>'] = { '<Cmd>BufferLast<CR>', 'Goto last' },
    -- Pin/unpin buffer
    ['<A-p>'] = { '<Cmd>BufferPin<CR>', 'Pin tab' },
    -- Close buffer
    ['<A-c>'] = { '<Cmd>BufferClose<CR>', 'Close tab' },
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    ['<C-p>'] = { '<Cmd>BufferPick<CR>', 'Magic picking mode' },
    -- Sort automatically by...
    ['<Space>bb'] = { '<Cmd>BufferOrderByBufferNumber<CR>', 'Sort tabs by number' },
    ['<Space>bd'] = { '<Cmd>BufferOrderByDirectory<CR>', 'Sort tabs by directory' },
    ['<Space>bl'] = { '<Cmd>BufferOrderByLanguage<CR>', 'Sort tabs by language' },
    ['<Space>bw'] = { '<Cmd>BufferOrderByWindowNumber<CR>', 'Sort tabs by window number' },
    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
}, {})
