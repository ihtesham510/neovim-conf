# Dependencies

- lazygit
- ripgrep
- fzf
- nodejs (v20 or above)
- unzip
- gcc
- cargo (rustc)
- tmux

# Keymaps

### Basic

| Mode | Key(s)       | Action               | Description                          |
| ---- | ------------ | -------------------- | ------------------------------------ |
| `i`  | `jk`, `kj`   | `<ESC>`              | Exit insert mode                     |
| `n`  | `<C-c>`      | `<cmd>%y+<cr>`       | Copy entire file to system clipboard |
| `n`  | `<C-d>`      | `<cmd>%d+<cr>`       | Delete entire file content           |
| `n`  | `<leader>nh` | `:nohl<CR>`          | Clear search highlights              |
| `v`  | `q`          | `<ESC>`              | Exit visual mode                     |
| `n`  | `<leader>w`  | `:w<CR>`             | Save file                            |
| `n`  | `<leader>q`  | `:qa<CR>`            | Quit Neovim                          |
| `x`  | `J`          | `:m '>+1<CR>gv=gv`   | Move selected text down              |
| `x`  | `K`          | `:m '<-2<CR>gv=gv`   | Move selected text up                |
| `n`  | `+`          | `<C-a>`              | Increment number                     |
| `n`  | `-`          | `<C-x>`              | Decrement number                     |
| `n`  | `<leader>sl` | `<C-w>v`             | Split window vertically              |
| `n`  | `<leader>sj` | `<C-w>s`             | Split window horizontally            |
| `n`  | `<leader>se` | `<C-w>=`             | Make splits equal size               |
| `n`  | `<leader>sE` | `<C-w><`             | Make splits equal size               |
| `n`  | `<leader>sx` | `<cmd>close<CR>`     | Close current split                  |
| `n`  | `L`          | `<cmd>bnext<CR>`     | Next buffer                          |
| `n`  | `H`          | `<cmd>bprevious<CR>` | Previous buffer                      |
| `n`  | `,`          | `<cmd>bd!<CR>`       | Close current buffer                 |

### Telescope

| Mode | Key(s)       | Action                                          | Description                     |
| ---- | ------------ | ----------------------------------------------- | ------------------------------- |
| `n`  | `<leader>ff` | `<cmd>Telescope find_files<cr>`                 | Fuzzy find files in cwd         |
| `n`  | `ff`         | `<cmd>Telescope find_files<cr>`                 | Fuzzy find files in cwd         |
| `n`  | `<leader>sr` | `<cmd>Telescope oldfiles<cr>`                   | Fuzzy find recent files         |
| `n`  | `sr`         | `<cmd>Telescope oldfiles<cr>`                   | Fuzzy find recent files         |
| `n`  | `sh`         | `<cmd>Telescope help_tags<cr>`                  | Search help tags                |
| `n`  | `sc`         | `<cmd>Telescope colorscheme theme=dropdown<cr>` | Search colorschemes             |
| `n`  | `sk`         | `<cmd>Telescope keymaps<cr>`                    | Search keymaps                  |
| `n`  | `sC`         | `<cmd>Telescope git_commits<cr>`                | Search Git commits              |
| `n`  | `gs`         | `<cmd>Telescope git_status<cr>`                 | Git status                      |
| `n`  | `sp`         | `<cmd>Telescope projects theme=dropdown<cr>`    | Find projects                   |
| `n`  | `F`          | `<cmd>Telescope live_grep<cr>`                  | Find string in cwd              |
| `n`  | `<leader>fs` | `<cmd>Telescope live_grep<cr>`                  | Find string in cwd              |
| `n`  | `fs`         | `<cmd>Telescope grep_string<cr>`                | Find string under cursor in cwd |
| `n`  | `fb`         | `<cmd>Telescope buffers<cr>`                    | Find buffers                    |
| `n`  | `<leader>fb` | `<cmd>Telescope buffers<cr>`                    | Find buffers                    |
| `n`  | `ft`         | `<cmd>TodoTelescope<cr>`                        | Find todos                      |

### Yanky (Copy and Pasting plugin)

| Mode          | Key(s)      | Action                                   | Description                           |
| ------------- | ----------- | ---------------------------------------- | ------------------------------------- |
| `n`, `v`, `x` | `<leader>p` | `:Telescope yank_history`                | Open Yank History                     |
| `i`           | `<C-p>`     | `:Telescope yank_history`                | Open Yank History (insert mode)       |
| `n`, `x`      | `y`         | `<Plug>(YankyYank)`                      | Yank text                             |
| `n`, `x`      | `p`         | `<Plug>(YankyPutAfter)`                  | Put yanked text after cursor          |
| `n`, `x`      | `P`         | `<Plug>(YankyPutBefore)`                 | Put yanked text before cursor         |
| `n`, `x`      | `gp`        | `<Plug>(YankyGPutAfter)`                 | Put yanked text after selection       |
| `n`, `x`      | `gP`        | `<Plug>(YankyGPutBefore)`                | Put yanked text before selection      |
| `n`           | `[y`        | `<Plug>(YankyCycleForward)`              | Cycle forward through yank history    |
| `n`           | `]y`        | `<Plug>(YankyCycleBackward)`             | Cycle backward through yank history   |
| `n`           | `]p`        | `<Plug>(YankyPutIndentAfterLinewise)`    | Put indented after cursor (linewise)  |
| `n`           | `[p`        | `<Plug>(YankyPutIndentBeforeLinewise)`   | Put indented before cursor (linewise) |
| `n`           | `]P`        | `<Plug>(YankyPutIndentAfterLinewise)`    | Put indented after cursor (linewise)  |
| `n`           | `[P`        | `<Plug>(YankyPutIndentBeforeLinewise)`   | Put indented before cursor (linewise) |
| `n`           | `>p`        | `<Plug>(YankyPutIndentAfterShiftRight)`  | Put and indent right                  |
| `n`           | `<p`        | `<Plug>(YankyPutIndentAfterShiftLeft)`   | Put and indent left                   |
| `n`           | `>P`        | `<Plug>(YankyPutIndentBeforeShiftRight)` | Put before and indent right           |
| `n`           | `<P`        | `<Plug>(YankyPutIndentBeforeShiftLeft)`  | Put before and indent left            |
| `n`           | `=p`        | `<Plug>(YankyPutAfterFilter)`            | Put after applying a filter           |
| `n`           | `=P`        | `<Plug>(YankyPutBeforeFilter)`           | Put before applying a filter          |
