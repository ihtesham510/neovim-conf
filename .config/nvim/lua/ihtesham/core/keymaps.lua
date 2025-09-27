vim.g.mapleader = ' '

local keymap = vim.keymap.set -- for conciseness
local opts = { noremap = true, silent = true }

-- paste without yanking
keymap('v', 'p', '"_dP', { desc = 'Paste without yanking replaced text' })

keymap('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk', silent = true })
keymap('i', 'kj', '<ESC>', { desc = 'Exit insert mode with kj', silent = true })

-- copy and delete files
keymap('n', '<C-c>', '<cmd>%y+<cr>', opts)
keymap('n', '<C-d>', '<cmd>%d+<cr>', opts)
-- for switching windows
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-h>', '<C-w>h', opts)

keymap('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
keymap('v', 'q', '<ESC>', { desc = 'Exit Visual Mode' })
-- save and exit
keymap('n', '<leader>w', ':w<CR>', { desc = 'Save File', silent = true })
keymap('n', '<leader>q', ':qa<CR>', { desc = 'Quit', silent = true })
-- Move text up and down
keymap('x', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('x', 'K', ":m '<-2<CR>gv=gv", opts)
-- increment/decrement numbers
keymap('n', '+', '<C-a>', { desc = 'Increment number', silent = true }) -- increment
keymap('n', '-', '<C-x>', { desc = 'Decrement number', silent = true }) -- decrement

-- window management
keymap('n', '<A-(>', '<C-w>>', { desc = 'Increase Window to left', silent = true }) -- split window vertically
keymap('n', '<A-)>', '<C-w><', { desc = 'Increase Window to right', silent = true }) -- split window vertically
keymap('n', 'wl', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap('n', 'wj', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap('n', 'we', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap('n', 'wE', '<C-w><', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap('n', 'wx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
-- tabs
keymap('n', 'L', '<cmd>bnext<CR>', { desc = 'Next tab', silent = true }) -- open new tab
keymap('n', 'H', '<cmd>bprevious<CR>', { desc = 'Previous tab', silent = true }) -- close current tab
keymap('n', ',', '<cmd>bd!<CR>', { desc = 'Close tab' }) --  move current buffer to new tab
