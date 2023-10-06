local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Rename the Vairable
keymap("n", "R", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Lsp Rename" })
-- copy and delete file
keymap("n", "<C-d>", "ggVGd", opts)
keymap("n", "<C-c>", "ggVGy", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- basic keymaps
keymap("n", "<leader>a", "<cmd>Alpha<cr>", opts)
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts, { desc = "NvimTree Toggle" })
keymap("n", "t", "<cmd>Neotree focus<cr>", opts, { desc = "NvimTree Toggle" })
keymap("n", "E", "ge", opts)
keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save file" })
keymap("n", "<leader>o", "<cmd>SymbolsOutline<cr>")
keymap("n", "<leader>q", "<cmd>q!<CR>", { desc = "Exit" })
keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Close Tab" })
keymap("n", ";", ":", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("v", "q", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
keymap("v", "E", "ge", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts, { desc = "Move line up and down in visual_mode" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts, { desc = "Move line up and down in visual_mode" })
-- window manager
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap("n", "q", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- Lazy
keymap("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy Nvim" })            -- close current split window
-- Telescope
keymap(
  "n",
  "ff",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{hidden=true})<cr>",
  { desc = "Telescope find_files" }
)
keymap("n", "sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }, opts)
keymap("n", "se", "<cmd>ErrorLensTelescope<cr>", { desc = "Fuzzy find Errors" })
keymap("n", "sk", "<cmd>Telescope keymaps<cr>", { desc = "Fuzzy find All keymaps" })
keymap("n", "sC", "<cmd>Telescope command<cr>", { desc = "Fuzzy find All Commands" })
keymap("n", "sc", "<cmd>Telescope colorscheme<cr>", { desc = "Fuzzy find All keymaps" })
keymap("n", "sp", "<cmd>Telescope projects theme=dropdown<cr>", { desc = "Fuzzy find All keymaps" })
keymap("n", "ss", "<cmd>Telescope file_browser theme=ivy<cr>", { desc = "Telescope File Browser" })
keymap("n", "F", "<cmd>Telescope live_grep <cr>", { desc = "Find string in cwd" })
keymap("v", "fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap("n", "fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
-- git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { desc = "Open lazygit" })
keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Git Next Hunk" })
keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Git Previous Hunk" })
keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Git Blame" })
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Git Preview Hunk" })
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Git Reset Hunk" })
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Git Reset buffer" })
keymap("n", "gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Git Stage Hunks" })
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Git Undo Stag Hunks" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Telescrope Git Branches" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Telescrope Git Commits" })
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git Sign Diff " })
-- Mason
keymap("n", "<leader>mm", "<cmd>Mason<cr>", { desc = "Open Mason" })
keymap("n", "<leader>ml", "<cmd>MasonLog<cr>", { desc = "Open Mason Log" })
keymap("n", "<leader>mu", "<cmd>MasonUpdate<cr>", { desc = "Update Language servers" })
-- lsp
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, { desc = "Lsp Hover" })
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Lsp implementation" })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Lsp references" })
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Lsp diagnostic " })
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "Lsp Format " })
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Lsp Install Info" })
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Lsp CodeAction" })
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", { desc = "Lsp diagnostic go to next" })
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { desc = "Lsp diagnostic go to prev" })
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Lsp Rename" })
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Lsp signature_help" })
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Lsp setloclist" })

-- Terminal --
keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "Node toggle" })
keymap("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", { desc = "Ncdu toggle" })
keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", { desc = "HTOP toggle" })
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "python toggle" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "horizontal terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "vertical terminal" })

-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
