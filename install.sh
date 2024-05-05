#!/bin/bash

## Error handling
set -euo pipefail

## Check bash is installed
if [ -z "${BASH_VERSION:-}" ]
then
  abort "Bash is required to interpret this script."
fi

echo "Starting setup..."

# Check if Homebrew is installed, install if not
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || abort "Failed to install Homebrew."
else
    echo "Homebrew is already installed."
fi

# Update Homebrew and upgrade any already-installed formulae
brew update && brew upgrade
brew bundle install 
brew install stow git # Just to be sure 


# Get the location of the current script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Paths to the source files
ZSHRC="${SCRIPT_DIR}/zsh/.zshrc"
ZPROFILE="${SCRIPT_DIR}/zsh/.zprofile"
ZSH_ALIASES="${SCRIPT_DIR}/zsh/.zsh_aliases"
TMUX="${SCRIPT_DIR}/tmux/.tmux.conf"

# Paths to where the symlinks should be created
TARGET_ZSHRC="$HOME/.zshrc"
TARGET_ZPROFILE="$HOME/.zprofile"
TARGET_ZSH_ALIASES="$HOME/.zsh_aliases"
TARGET_TMUX="$HOME/.tmux.conf"

# Remove existing files or links
rm -f "$TARGET_ZSHRC" "$TARGET_ZPROFILE" "$TARGET_ZSH_ALIASES"
rm -f "$TARGET_TMUX"

# Clone each plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
git clone https://github.com/christoomey/vim-tmux-navigator ~/.tmux/plugins/vim-tmux-navigator
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/jabirali/tmux-minimono ~/.tmux/plugins/tmux-minimono

# Create new symlinks
ln -s "$ZSHRC" "$TARGET_ZSHRC"
ln -s "$ZPROFILE" "$TARGET_ZPROFILE"
ln -s "$ZSH_ALIASES" "$TARGET_ZSH_ALIASES"
ln -s "$TMUX" "$TARGET_TMUX"

echo "Symlinks created successfully."
