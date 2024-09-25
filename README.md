# About this configuration:

## Overview

This is a configuration for the text editor [neovim](https://neovim.io/).

My goal is to keep this configuration relatively simple. Some inconsistencies may arise
due to adding language support, but I want to avoid needing to memorize too many external
keybinds.

This guide, for my configuration, is only for **Linux**. While these settings
will work on Windows with all of the prereqs installed (such as python and
nvm), I will not provide instructions for that here.

## Usage/Installation

If you don't have a package manager that can install neovim, you'll need
to [build it from source](https://github.com/neovim/neovim/blob/master/BUILD.md).
Follow the four steps listed there.

To install this configuration: 

```console
$ cd ~
$ mkdir .config
$ cd .config
$ rm -rf nvim
```
(Warning: the last command will **erase your entire existing configuration** if
one exists. You have been warned!)
```console
$ git clone https://github.com/rajsugavanam/NVIM-Config nvim
```

### Prerequisites

- `nvm`:
```console
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```
Or by using a package manager.

- `python3`:
Install using a package manager, such as with the examples listed below
1. `$ sudo dnf install python3`
2. `$ sudo apt install python3`

- `pynvim`:
1. `$ python3 -m ensurepip --upgrade`
2. `$ python3 -m pip install --user --upgrade pynvim`

### Before You Start

I use UltiSnips for snippets, which are autocomplete shortcuts.
You can create your own or modify existing ones by looking at
`~/.config/nvim/UltiSnips/<snippet language>/<some snippet file name>.snippets`.

### Common Custom Actions
- `<space>fb` (Open File Explorer)
- `\fb` (Open List of Open Windows/Buffers)
- `\ff` (Open List of All Files in All Subdirectories)
- `cs)}` (When inside `()`, change it to `{}`; bracket types can be replaced
        with any other bracket/surround type)
- `<Visual>S)` (Surround highlighted text with `()`)

### Additional Editor Tips

- If you'd like to add on, lazy.nvim is used for managing packages. See
  [folke/lazy.nvim](https://github.com/folke/lazy.nvim).
- nvim-cmp is used for completion. See [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- If you're lost or forget any keybind, use `<Leader>h` (which is usually
  `\h` in quick succession) to view a list of every keybind by its binding.
