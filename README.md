# Neovim Configuration

This repository contains my personal Neovim configuration, built with a focus on performance, modern features, and a smooth developer experience. It leverages **Neovim's built‑in package manager** (`vim.pack`) and is designed for Neovim nightly (0.13+).

---

## Features

- **Plugin Management** – Built-in `vim.pack` with custom commands (`PackAdd`, `PackDel`, `PackUpdate`)
- **LSP** – Mason, mason‑lspconfig, nvim‑lspconfig for language servers
- **Autocompletion** – nvim‑cmp with buffer, path, LSP, and Lua sources; LuaSnip for snippets
- **Treesitter** – Syntax highlighting and incremental parsing
- **Telescope** – Fuzzy finder for files, Git files, live grep, buffers, help tags
- **Harpoon** – Fast file navigation with marks
- **Git** – vim‑fugitive and custom keymaps for push/pull/status
- **Formatting** – Conform.nvim for auto‑format on save
- **UI Enhancements** – lualine, noice.nvim, notify, nightfox theme, highlight‑colors
- **Custom Autocommands** – Auto‑format, trailing space removal, yank highlighting, TeX helper, etc.

---

## Plugin Management with `vim.pack`

Starting with Neovim 0.13, the built‑in `vim.pack` provides a lightweight, native way to manage plugins. I use it exclusively, and I've added three custom user commands to simplify plugin operations:

| Command       | Description |
|---------------|-------------|
| `:PackAdd user/repo` | Install one or more plugins (e.g., `:PackAdd tpope/vim‑fugitive`) |
| `:PackDel plugin`    | Delete one or more installed plugins |
| `:PackUpdate`        | Update all plugins; pass names to update specific ones (e.g., `:PackUpdate telescope.nvim`) |

These commands are defined in `commands.lua` and use `vim.pack.add()`, `vim.pack.del()`, and `vim.pack.update()` under the hood.

Source: [Repo](https://github.com/Sin-cy/nvim-scratch/) [File](https://raw.githubusercontent.com/Sin-cy/nvim-scratch/refs/heads/main/lua/commands.lua)

---

## Installed Plugins

All plugins are declared in `pack.lua` using `vim.pack.add()`. Below is a list with brief descriptions:

| Plugin | Description |
|--------|-------------|
| [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | Carbonfox colorscheme |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Icons for various filetypes |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Utility library (required by many plugins) |
| [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI components |
| [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification system |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | UI for messages, cmdline, and popups |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git wrapper |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Treesitter parser and highlighting |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF‑like sorting for Telescope |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap help popup |
| [mbbill/undotree](https://github.com/mbbill/undotree) | Undo history visualisation |
| [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Highlight color codes |
| [captbaritone/better-indent-support-for-php-with-html](https://github.com/captbaritone/better-indent-support-for-php-with-html) | Improved PHP/HTML indentation |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer source for nvim‑cmp |
| [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) | Path source |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source |
| [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | Lua source |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip source for nvim‑cmp |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP installer |
| [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Bridge between Mason and lspconfig |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) | Fast file navigation (harpoon2 branch) |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter |

> **Note:** The `pack.lua` file sources all these plugins, and the configuration for most of them is split across other Lua files (e.g., `telescope.lua`, `harpoon.lua`, etc.).

---

## Keybindings

Leader key is set to `,` (comma). Below is a comprehensive table of all keymaps:

### General Navigation & Editing

| Keymap | Mode | Description |
|--------|------|-------------|
| `J` | Normal | Join lines and preserve cursor position |
| `<C-d>` | Normal | Scroll down half‑page, keep cursor centered |
| `<C-u>` | Normal | Scroll up half‑page, keep cursor centered |
| `n` | Normal | Next search result, center result |
| `N` | Normal | Previous search result, center result |
| `<leader>n` | Normal | Open Netrw file explorer |
| `<leader>u` | Normal | Toggle Undotree |
| `<leader>so` | Normal | Source current file |

### Window & Buffer Management

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | Normal | Move to left window |
| `<C-l>` | Normal | Move to right window |
| `<C-k>` | Normal | Move to upper window |
| `<C-j>` | Normal | Move to lower window |
| `<leader>bp` | Normal | Previous buffer |
| `<leader>bn` | Normal | Next buffer |
| `<leader>bd` | Normal | Delete buffer |
| `<leader>sv` | Normal | Vertical split |
| `<leader>sh` | Normal | Horizontal split |
| `<leader>sm` | Normal | Toggle window maximizer |
| `<leader>nt` | Normal | New tab |
| `<leader>ct` | Normal | Close tab |
| `<leader>pt` | Normal | Previous tab |
| `<leader>nn` | Normal | Next tab |

### Git (Fugitive)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gg` | Normal | Open Fugitive status |
| `<leader>gp` | Normal | Git push |
| `<leader>gP` | Normal | Git pull --rebase |
| `<leader>gt` | Normal | Start `:Git push -u origin ` (interactive) |

### Harpoon (Quick File Navigation)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>aa` | Normal | Add current file to Harpoon list |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<M-1>` | Normal | Select Harpoon item 1 |
| `<M-2>` | Normal | Select Harpoon item 2 |
| `<M-3>` | Normal | Select Harpoon item 3 |
| `<M-4>` | Normal | Select Harpoon item 4 |
| `<C-p>` | Normal | Move to previous Harpoon item |
| `<C-n>` | Normal | Move to next Harpoon item |

### Telescope (Fuzzy Finder)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fG` | Normal | Find files (Git tracked) |
| `<leader>fg` | Normal | Live grep |
| `<leader>fb` | Normal | List buffers |
| `<leader>fh` | Normal | Help tags |

### Copy, Paste, & Selection

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>p` | Visual | Paste without overwriting unnamed register |
| `<leader>y` | Normal/Visual | Yank to system clipboard (`+`) |
| `<leader>Y` | Normal | Yank entire file to system clipboard |
| `<leader>d` | Visual | Cut to system clipboard |
| `<leader>v` | Normal | Paste from system clipboard |
| `<leader>a` | Normal | Select all |

### Indentation & Comments

| Keymap | Mode | Description |
|--------|------|-------------|
| `<` | Visual | Indent left, keep selection |
| `>` | Visual | Indent right, keep selection |
| `<C-_>` | Normal/Visual | Toggle comment (using `gcc`) |

### Build & Execute

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>c` | Normal | Write file and run `compiler` on current file |
| `<leader>t` | Normal | Run current Python file (`python %`) |
| `<leader>x` | Normal | Make current file executable (`chmod +x`) |
| `<leader>pw` | Normal | Open corresponding PDF/HTML or preview (`opout`) |

---

## Additional Configuration

- **Autocommands** (`autocmds.lua`):
  - Automatically start Treesitter for supported languages.
  - Auto‑format on save using `conform.nvim`.
  - Remove trailing spaces on save.
  - Highlight yanked text.
  - Filetype detection for TeX.
  - TeX cleanup on exit (`texclear`).
  - Source shell config files after writing.

- **Options** (`options.lua`):
  - Tabs → 2 spaces, smart indentation.
  - Relative line numbers, search settings, colorscheme (carbonfox).
  - Netrw settings (no banner, list style, window size).
  - Undo directory, split behavior, mouse support, clipboard integration.

- **Commands** (`commands.lua`):
  - `PackAdd`, `PackDel`, `PackUpdate` – manage plugins with `vim.pack`.

---

## Installation

1. Clone this repository into your Neovim config directory (usually `~/.config/nvim`):
   ```bash
   git clone https://github.com/your-username/your-config.git ~/.config/nvim
   ```
2. Ensure you are using Neovim nightly (0.13+). The `vim.pack` API is only available in recent nightly builds.
3. Start Neovim – all plugins will be installed automatically via `vim.pack`.
4. (Optional) Run `:PackUpdate` to update any plugins manually.

---

## Contributing / Customisation

Feel free to fork this configuration and adapt it to your needs. The file structure is modular – each concern (keymaps, options, plugins, LSP) lives in its own Lua file, making it easy to extend or disable parts.

If you have any questions or suggestions, please open an issue or pull request.
