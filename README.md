# Readme for Config Files

## This README outlines the steps to set up various tools such as iTerm2, Neovim, Tmux, and Zsh 
## using the configuration files in this repository.

### Order of Installations

1. Begin by installing iTerm2, Neovim, and Tmux, and some others. These can be installed using Homebrew on macOS:

$ brew install --cask iterm2
$ brew install neovim
$ brew install tmux
$ brew install ripgrep
$ brew install bat

2. Next, configure Zsh:
- Navigate to the `/zsh` directory in this repository.
- Follow the steps listed there to set up Zsh, including aliases, Oh My Zsh, it's accompanying plugins, and Powerlevel10k theme.

3. Set Up Neovim. You can choose either NvChad or Lazy, and include the following plugins:
- Telescope: for fuzzy finding and searching.
- Treesitter: for advanced syntax highlighting and code manipulation.
- Mason: for managing external editor tooling.
- Vim-tmux-navigator: To vanquish my enemies, slay the dragon, and save the princess. 

4. Source Tmux Configuration
$ tmux source ~/.config/tmux/tmux.conf

