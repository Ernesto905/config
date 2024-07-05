#!/bin/bash

## Error Handling
set -euo pipefail

# Handle premature exits
abort() {
  echo "Error: $@" >&2
  exit 1
}

## Ensure bash is installed
if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
fi

## Ensure the script is run on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  abort "This script is intended for macOS only."
fi

echo "Starting setup..."

# Check if Homebrew is installed, install if not 
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || abort "Failed to install Homebrew."
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew and upgrade any already-installed formulae
if ! brew update || ! brew upgrade; then
  abort "Homebrew update or upgrade failed."
fi

# Install 
brew bundle install
#
# Get the location of the current script
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

# Prepare for tmux plugin installations
mkdir -p ~/.tmux/plugins

# Clone each plugin
clone_plugin() {
  local url=$1
  local path="$HOME/.tmux/plugins/$(basename "$url" .git)"
  if [ -e "$path" ]; then
    echo "Plugin $(basename "$url") already cloned"
  else
    git clone "$url" "$path" || abort "Failed to clone $url"
  fi
}

clone_plugin https://github.com/tmux-plugins/tpm
clone_plugin https://github.com/tmux-plugins/tmux-sensible
clone_plugin https://github.com/christoomey/vim-tmux-navigator
clone_plugin https://github.com/tmux-plugins/tmux-resurrect
clone_plugin https://github.com/jabirali/tmux-minimono

# Function to create symlinks and handle failures
create_symlink() {
  local source=$1
  local target=$2
  ln -s "$source" "$target" || abort "Failed to create symlink from $source to $target"
  echo "Symlink created for $(basename "$source")"
}

# Remove files for symlinks
rm -rf $TARGET_ZSHRC
rm -rf $TARGET_ZPROFILE
rm -rf $TARGET_ZSH_ALIASES
rm -rf $TARGET_TMUX

create_symlink "$ZSHRC" "$TARGET_ZSHRC"
create_symlink "$ZSH_ALIASES" "$TARGET_ZSH_ALIASES"
create_symlink "$ZPROFILE" "$TARGET_ZPROFILE"
create_symlink "$TMUX" "$TARGET_TMUX"

echo "Setup completed successfully."
