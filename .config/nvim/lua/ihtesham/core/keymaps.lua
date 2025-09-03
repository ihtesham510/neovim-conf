vim.g.mapleader = " "

local keymap = vim.keymap.set -- for conciseness
local opts = { noremap = true, silent = true }

keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- copy and delete files
keymap("n", "<C-c>", "<cmd>%y+<cr>", opts)
keymap("n", "<C-d>", "<cmd>%d+<cr>", opts)

keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap("v", "q", "<ESC>", { desc = "Exit Visual Mode" })
-- save and exit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save File" })
keymap("n", "<leader>q", ":qa<CR>", { desc = "Quit" })
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
-- increment/decrement numbers
keymap("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap("n", "<A-(>", "<C-w>>", { desc = "Increase Window to left" }) -- split window vertically
keymap("n", "<A-)>", "<C-w><", { desc = "Increase Window to right" }) -- split window vertically
keymap("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sE", "<C-w><", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- tabs
keymap("n", "L", "<cmd>bnext<CR>", { desc = "Next tab" }) -- open new tab
keymap("n", "H", "<cmd>bprevious<CR>", { desc = "Previous tab" }) -- close current tab
keymap("n", ",", "<cmd>bd!<CR>", { desc = "Close tab" }) --  move current buffer to new tab
