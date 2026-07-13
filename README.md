# Neovim Configuration

> A modern, performant Neovim setup built around **native plugins**, **LSP**, and a **smooth developer experience**.

This configuration harnesses the power of Neovim's built‑in `vim.pack` package manager, integrates a full LSP stack with Mason, and brings together a curated set of plugins for editing, navigation, and UI. It's designed for **Neovim nightly (0.13+)** and is structured to be easy to extend or modify.

---

## What's Inside

- **🗄️ Native Plugin Management** – Use `vim.pack` with custom commands (`:PackAdd`, `:PackDel`, `:PackUpdate`, `:PackClean`). No external package manager required.
- **🧠 Smart LSP & Completions** – Mason + mason‑lspconfig + nvim‑lspconfig. Autocompletion powered by nvim‑cmp with buffer, path, LSP, and Lua sources, plus LuaSnip snippets.
- **🌳 Treesitter Everywhere** – Syntax highlighting, indentation, and folding based on the AST. Auto‑installs and attaches parsers.
- **🔍 Telescope** – Blazing‑fast fuzzy finder for files, Git files, live grep, buffers, help tags, and more.
- **⚡ Harpoon** – Quick file navigation with marks and a Telescope‑powered menu.
- **📐 Formatting** – Conform.nvim for auto‑format on save with support for multiple formatters per filetype.
- **🎨 UI Enhancements** – Tokyo‑night theme, lualine statusline, noice.nvim for improved UI messages, and colour highlighting.
- **🐙 Git Integration** – vim‑fugitive with custom keymaps for push, pull, and status.
- **⌨️ Thoughtful Keybindings** – Leader is `,` – intuitive bindings for window/buffer management, copy/paste, indentation, and more.

---

## Plugin Management with `vim.pack`

Starting with Neovim 0.13, the built‑in `vim.pack` provides a lightweight, native way to manage plugins. I use it exclusively, and I've added custom user commands to simplify operations:

| Command       | Description |
|---------------|-------------|
| `:PackAdd user/repo` | Install one or more plugins (e.g., `:PackAdd tpope/vim‑fugitive`) |
| `:PackDel plugin`    | Delete one or more installed plugins |
| `:PackUpdate`        | Update all plugins; pass names to update specific ones |
| `:PackClean`         | Clean all unused plugins |

### Keymaps for Package Management

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>pu` | Normal | Update all plugins at once |
| `<leader>pc` | Normal | Clean all unused plugins |

These commands are defined in `commands.lua` and use `vim.pack.add()`, `vim.pack.del()`, and `vim.pack.update()` under the hood.

---

## Installed Plugins

All plugins are declared in `pack.lua` using `vim.pack.add()`. Here's the full list:

| Plugin | Description |
|--------|-------------|
| [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (night style) |
| [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | Icons for filetypes |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Utility library |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | Git wrapper |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Treesitter parser and highlighting |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF‑like sorting |
| [mbbill/undotree](https://github.com/mbbill/undotree) | Undo history visualisation |
| [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Highlight color codes |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer source |
| [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) | Path source |
| [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source |
| [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | Lua source |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip source |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/DAP installer |
| [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Bridge to lspconfig |
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client config |
| [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) | Fast file navigation (harpoon2 branch) |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter |
| [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Auto‑close/rename HTML/XML tags |
| [folke/noice.nvim](https://github.com/folke/noice.nvim) | Improved UI for messages, cmdline, and popup |

---

## Keybindings

Leader key is `,` (comma). Below is a comprehensive table of all keymaps:

### General Navigation & Editing

| Keymap | Mode | Description |
|--------|------|-------------|
| `J` | Normal | Join lines and preserve cursor position |
| `<C-d>` | Normal | Scroll down half‑page, keep cursor centered |
| `<C-u>` | Normal | Scroll up half‑page, keep cursor centered |
| `n` / `N` | Normal | Next/previous search result, center result |
| `<leader>n` | Normal | Open Netrw file explorer |
| `<leader>u` | Normal | Toggle Undotree |
| `<leader>so` | Normal | Source current file |

### Window & Buffer Management

| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h/l/k/j>` | Normal | Move to left/right/upper/lower window |
| `<leader>bp` | Normal | Previous buffer |
| `<leader>bn` | Normal | Next buffer |
| `<leader>bd` | Normal | Delete buffer |
| `<leader>sv` | Normal | Vertical split |
| `<leader>sh` | Normal | Horizontal split |
| `<leader>sm` | Normal | Toggle window maximizer |
| `<leader>nt/ct/pt/nn` | Normal | New/close/previous/next tab |

### Git (Fugitive)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gg` | Normal | Open Fugitive status |
| `<leader>gp` | Normal | Git push |
| `<leader>gP` | Normal | Git pull --rebase |
| `<leader>gt` | Normal | Start `:Git push -u origin` (interactive) |

### Harpoon (Quick File Navigation)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>aa` | Normal | Add current file to Harpoon list |
| `<leader>fl` | Normal | Display Harpoon quick menu (Telescope) |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<M-1>` to `<M-4>` | Normal | Select Harpoon item 1–4 |
| `<C-p>` / `<C-n>` | Normal | Previous/next Harpoon item |

### Telescope (Fuzzy Finder)

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fG` | Normal | Find files (Git tracked) |
| `<leader>fg` | Normal | Live grep |
| `<leader>fs` | Normal | Grep string (interactive) |
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
| `<` / `>` | Visual | Indent left/right, keep selection |
| `<C-_>` | Normal/Visual | Toggle comment (using `gcc`) |

### Build & Execute

| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>c` | Normal | Write file and run `compiler` on current file |
| `<leader>t` | Normal | Run current Python file (`python %`) |
| `<leader>x` | Normal | Make current file executable (`chmod +x`) |
| `<leader>pw` | Normal | Open corresponding PDF/HTML or preview (`opout`) |

---

## LSP & Autocompletion

Language servers are managed with **Mason** and configured via **nvim‑lspconfig**. The following servers are installed by default:

- `lua_ls` – Lua
- `intelephense` – PHP
- `ts_ls` – TypeScript/JavaScript
- `eslint` – ESLint
- `tailwindcss` – Tailwind CSS
- `jsonls` – JSON
- `stylua` – Lua formatting
- `cssls`, `clangd`, `ruff`, `emmet_language_server`, `pyright`

Autocompletion is powered by **nvim‑cmp** with sources for LSP, buffer, path, and LuaSnip snippets. Keymaps for navigation and confirmation are intuitive (`<C-j/k>`, `<C-Space>`, `<CR>`).

---

## Autocommands & Smart Behaviours

Several automatic behaviours are defined in `autocmds.lua`:

- **Treesitter attach** – Automatically starts Treesitter for supported languages.
- **Auto‑format on save** – Uses `conform.nvim` to format files on `BufWritePre`.
- **Trailing space removal** – Deletes trailing whitespace on save.
- **Yank highlighting** – Highlights text when yanked.
- **TeX support** – Sets filetype for `.tex` files and runs `texclear` on exit.
- **Shell config sourcing** – Auto‑sources `.bashrc`, `.zshrc`, etc., after writing.

---

## Installation

1. Clone this repository into your Neovim config directory:
   ```bash
   git clone https://github.com/duncan-f/nvim.git ~/.config/nvim
   ```
2. Ensure you are using **Neovim nightly (0.13+)** – `vim.pack` is only available in recent nightly builds.
3. Start Neovim – all plugins will be installed automatically via `vim.pack`.
4. (Optional) Run `:PackUpdate` to update any plugins manually.

---

## Customisation & Contributing

This configuration is modular – each concern (keymaps, options, plugins, LSP) lives in its own Lua file, making it easy to extend or disable parts.

Feel free to fork this repository and adapt it to your needs. If you have suggestions or improvements, open an issue or pull request – contributions are always welcome!

---

**Happy coding!** 🚀
