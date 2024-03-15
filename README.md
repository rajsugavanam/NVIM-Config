# About this configuration:

- UltiSnips snippets should be stored in ~/.config/nvim
- pynvim is required (pip install pynvim).
- lazy.nvim is used for managing packages. See [folke/lazy.nvim](https://github.com/folke/lazy.nvim).
- I am primarily updating this for **Mac**. I will cherry-pick commits over to
  the windows version, however I will not be comprehensively testing it.
- nvim-cmp is used for completion. See [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- python venv and node are required. It is recommended to use pip to install
  venv and nvm to install node.

My goal is to keep this configuration relatively simple. Some inconsistencies may arise
due to adding language support, but I want to avoid needing to memorize too many external
keybinds.

To install, first delete the `nvim` folder in `~/.config/nvim`.
Then run `git clone https://github.com/rajsugavanam/NVIM-Config nvim`.
