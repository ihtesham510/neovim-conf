<div align="center">

```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

**A carefully crafted development environment for the terminal-first developer.**

[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![tmux](https://img.shields.io/badge/tmux-3.x-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)](https://github.com/tmux/tmux)
[![Lua](https://img.shields.io/badge/Lua-5.1-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org)
[![Shell](https://img.shields.io/badge/Zsh-configured-F15A24?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.zsh.org)

</div>

---

## ⚡ Overview

This repository contains my personal dotfiles for a fully keyboard-driven development workflow, featuring a Neovim IDE setup built from scratch in Lua, a tmux configuration for multiplexed terminal sessions, and a Zsh shell setup.

```
dotfiles/
├── .config/
│   └── nvim/              # Neovim config (Lua, LunarVim/Neovim-from-scratch base)
│       └── lua/user/
│           ├── options.lua
│           ├── keymaps.lua
│           ├── plugins.lua
│           ├── colorscheme.lua
│           ├── cmp.lua
│           ├── lsp/
│           ├── telescope.lua
│           ├── treesitter.lua
│           ├── autopairs.lua
│           ├── comment.lua
│           ├── gitsigns.lua
│           ├── nvim-tree.lua
│           ├── bufferline.lua
│           ├── lualine.lua
│           ├── toggleterm.lua
│           ├── alpha.lua
│           └── whichkey.lua
├── .tmux.conf             # tmux configuration
└── .zshrc                 # Zsh shell configuration
```

---

## 🧠 Neovim

> Built on top of [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) — a fully Lua-based Neovim config designed to be readable and educational.

### 🔌 Plugins

| Plugin                                        | Description                                                           |
| --------------------------------------------- | --------------------------------------------------------------------- |
| `wbthomason/packer.nvim`                      | Plugin manager — manages itself                                       |
| `nvim-lua/plenary.nvim`                       | Lua utility library, required by many plugins                         |
| `windwp/nvim-autopairs`                       | Auto-close brackets, parens, quotes; integrates with cmp & treesitter |
| `numToStr/Comment.nvim`                       | Smart code commenting (`gcc`, `gbc`)                                  |
| `JoosepAlviste/nvim-ts-context-commentstring` | Treesitter-aware comment strings                                      |
| `kyazdani42/nvim-web-devicons`                | File type icons for the UI                                            |
| `kyazdani42/nvim-tree.lua`                    | File explorer tree                                                    |
| `akinsho/bufferline.nvim`                     | Buffer tabs at the top                                                |
| `moll/vim-bbye`                               | Close buffers without closing windows                                 |
| `nvim-lualine/lualine.nvim`                   | Blazing fast status line in Lua                                       |
| `akinsho/toggleterm.nvim`                     | Integrated floating/split terminal                                    |
| `ahmedkhalf/project.nvim`                     | Project root detection and management                                 |
| `lewis6991/impatient.nvim`                    | Speed up Lua module loading                                           |
| `lukas-reineke/indent-blankline.nvim`         | Indentation guides                                                    |
| `goolord/alpha-nvim`                          | Customizable start screen / dashboard                                 |
| `folke/which-key.nvim`                        | Popup showing available keybindings                                   |
| **Colorschemes**                              |                                                                       |
| `lunarvim/colorschemes`                       | LunarVim colorscheme collection                                       |
| `lunarvim/darkplus.nvim`                      | Dark+ VSCode-inspired colorscheme                                     |
| **Completion (cmp)**                          |                                                                       |
| `hrsh7th/nvim-cmp`                            | Completion engine                                                     |
| `hrsh7th/cmp-buffer`                          | Completions from current buffer                                       |
| `hrsh7th/cmp-path`                            | Filesystem path completions                                           |
| `hrsh7th/cmp-cmdline`                         | Command-line completions                                              |
| `saadparwaiz1/cmp_luasnip`                    | Snippet completions                                                   |
| `hrsh7th/cmp-nvim-lsp`                        | LSP-based completions                                                 |
| `hrsh7th/cmp-nvim-lua`                        | Neovim Lua API completions                                            |
| **Snippets**                                  |                                                                       |
| `L3MON4D3/LuaSnip`                            | Snippet engine written in Lua                                         |
| `rafamadriz/friendly-snippets`                | Community snippet collection                                          |
| **LSP**                                       |                                                                       |
| `neovim/nvim-lspconfig`                       | Quickstart configs for built-in LSP client                            |
| `williamboman/mason.nvim`                     | Portable LSP/linter/formatter installer                               |
| `williamboman/mason-lspconfig.nvim`           | Bridge between Mason and lspconfig                                    |
| `jose-elias-alvarez/null-ls.nvim`             | Inject formatters & linters as LSP sources                            |
| `RRethy/vim-illuminate`                       | Highlight other uses of the word under cursor                         |
| **Telescope**                                 |                                                                       |
| `nvim-telescope/telescope.nvim`               | Fuzzy finder over everything                                          |
| `nvim-telescope/telescope-media-files.nvim`   | Preview media files in Telescope                                      |
| **Treesitter**                                |                                                                       |
| `nvim-treesitter/nvim-treesitter`             | Advanced syntax highlighting & code parsing                           |
| `JoosepAlviste/nvim-ts-context-commentstring` | Context-aware comment strings                                         |
| **Git**                                       |                                                                       |
| `lewis6991/gitsigns.nvim`                     | Git blame, hunks, diff signs in the gutter                            |

---

### ⌨️ Neovim Keymaps

> **Leader key:** `<Space>`

#### 🪟 Window Navigation

| Keybinding | Mode   | Action               |
| ---------- | ------ | -------------------- |
| `Ctrl-h`   | Normal | Move to left window  |
| `Ctrl-j`   | Normal | Move to window below |
| `Ctrl-k`   | Normal | Move to window above |
| `Ctrl-l`   | Normal | Move to right window |

#### 📐 Window Resizing

| Keybinding   | Mode   | Action                 |
| ------------ | ------ | ---------------------- |
| `Ctrl-Up`    | Normal | Decrease window height |
| `Ctrl-Down`  | Normal | Increase window height |
| `Ctrl-Left`  | Normal | Decrease window width  |
| `Ctrl-Right` | Normal | Increase window width  |

#### 📄 Buffer Management

| Keybinding | Mode   | Action                |
| ---------- | ------ | --------------------- |
| `Shift-l`  | Normal | Go to next buffer     |
| `Shift-h`  | Normal | Go to previous buffer |

#### ✏️ Text Editing

| Keybinding | Mode   | Action                 |
| ---------- | ------ | ---------------------- |
| `Alt-j`    | Normal | Move current line down |
| `Alt-k`    | Normal | Move current line up   |
| `jk`       | Insert | Exit insert mode       |
| `kj`       | Insert | Exit insert mode       |

#### 📋 Visual Mode

| Keybinding | Mode   | Action                             |
| ---------- | ------ | ---------------------------------- |
| `<`        | Visual | Dedent and keep selection          |
| `>`        | Visual | Indent and keep selection          |
| `Alt-j`    | Visual | Move selection down                |
| `Alt-k`    | Visual | Move selection up                  |
| `p`        | Visual | Paste without overwriting register |

#### 📦 Visual Block Mode

| Keybinding | Mode         | Action          |
| ---------- | ------------ | --------------- |
| `J`        | Visual Block | Move block down |
| `K`        | Visual Block | Move block up   |
| `Alt-j`    | Visual Block | Move block down |
| `Alt-k`    | Visual Block | Move block up   |

---

## 🖥️ tmux

> Prefix key changed from the default `Ctrl-b` to **`Ctrl-t`** for ergonomics.

### 🔌 Plugins

| Plugin                            | Description                                  |
| --------------------------------- | -------------------------------------------- |
| `tmux-plugins/tpm`                | Tmux Plugin Manager                          |
| `niksingh710/minimal-tmux-status` | Minimal, clean status bar                    |
| `tmux-plugins/tmux-sensible`      | Sensible tmux defaults everyone can agree on |

### ⌨️ tmux Keymaps

> **Prefix:** `Ctrl-t`

#### 🪟 Window Management

| Keybinding | Action                                    |
| ---------- | ----------------------------------------- |
| `Alt-c`    | Create new window (inherits current path) |
| `Alt-n`    | Go to next window                         |
| `Alt-p`    | Go to previous window                     |
| `Alt-w`    | Kill current window                       |
| `Alt-e`    | Rename current window                     |

#### ✂️ Pane Splitting

| Keybinding   | Action                                     |
| ------------ | ------------------------------------------ |
| `Alt-Ctrl-l` | Split pane vertically (right, same path)   |
| `Alt-Ctrl-k` | Split pane horizontally (below, same path) |
| `Alt-m`      | Toggle pane zoom (fullscreen)              |

#### 🧭 Pane Navigation

| Keybinding | Action             |
| ---------- | ------------------ |
| `Alt-h`    | Move to left pane  |
| `Alt-j`    | Move to pane below |
| `Alt-k`    | Move to pane above |
| `Alt-l`    | Move to right pane |

#### 🗂️ Session Management

| Keybinding | Action                           |
| ---------- | -------------------------------- |
| `Alt-s`    | Show session/window tree chooser |
| `Alt-d`    | Detach from current session      |
| `Alt-N`    | Switch to next session           |
| `Alt-P`    | Switch to previous session       |

#### ⚙️ General Settings

| Setting          | Value                 |
| ---------------- | --------------------- |
| Mouse support    | Enabled               |
| History limit    | 5000 lines            |
| Window numbering | Starts at 1           |
| Pane numbering   | Starts at 1           |
| True color       | Enabled (`xterm*:Tc`) |

---

## 🚀 Installation

### Prerequisites

- **Neovim** >= 0.9
- **tmux** >= 3.x
- **Zsh**
- **Git**
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `ripgrep` — for Telescope live grep
- `fd` — for Telescope find files
- **Node.js** — required by many LSP servers

### Setup

```bash
# Clone the repo
git clone https://github.com/ihtesham510/dotfiles.git ~/dotfiles

# Symlink Neovim config
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

# Symlink tmux config
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Symlink zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# Install tmux plugins (after starting tmux)
# Inside tmux: press Ctrl-t then I (capital i)

# Install Neovim plugins
nvim +PackerSync
```

---

## 🎨 Colorscheme

The config ships with the **darkplus.nvim** theme (VSCode Dark+ inspired) along with the full LunarVim colorscheme collection for easy switching.

---

<div align="center">

Made with ❤️ by [ihtesham510](https://github.com/ihtesham510)

</div>
