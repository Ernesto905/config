# README for ZSH Configuration

## Overview
This README provides instructions for setting up ZSH using the configuration files in this repository. These steps are intended for a clean installation on a new machine.

## Prerequisites
- Ensure you have `zsh` installed on your system. If not, install it using your distribution's package manager (e.g., `sudo apt install zsh` for Debian/Ubuntu).
- Make sure you have git installed to clone the repository (e.g., `sudo apt install git`).

## Installation Steps

1. Clone this repository to your local machine. 

2. Create symbolic links for the ZSH configuration files:
- Link `.zshrc`:
  ```
  ln -s ~/.config/zsh/.zshrc ~/.zshrc
  ```
- Link `.zshrc_aliases`:
  ```
  ln -s ~/.config/zsh/.zshrc_aliases ~/.zshrc_aliases
  ```
- Link `.zshenv`:
  ```
  ln -s ~/.config/zsh/.zshenv ~/.zshenv
  ```
3. Restart your terminal or source the new `.zshrc` file:

## Post-Installation
After setting up, you might want to customize your ZSH environment further. Refer to the individual configuration files for customization options.

