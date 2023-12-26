# README for ZSH Configuration

This README provides instructions for setting up ZSH using the configuration files in this repository, along with Oh My Zsh and the Powerlevel10k theme. These steps are intended for a clean installation on a new machine.

## Prerequisites
- Ensure you have `zsh` installed on your system. If not, install it using your distribution's package manager (e.g., `sudo apt install zsh` for Debian/Ubuntu).
- Make sure you have git installed to clone the repository (e.g., `brew install git`).
- Install bat as a cat command alternative `brew install bat`

## Installation Steps

1. **Clone this repository** to your local machine: 

2. **Install Oh My Zsh**:
Note: This will create a new `.zshrc` in your home directory. You'll replace this with a symlink in the next step.

3. **Install Powerlevel10k**:
- Clone the Powerlevel10k repository to the Oh My Zsh themes directory:
  ```
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```

4. **Create symbolic links** for the ZSH configuration files:
- Backup the newly created `.zshrc` by Oh My Zsh (optional):
  ```
  mv ~/.zshrc ~/.zshrc.oh-my-zsh-backup
  ```
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

5. **Restart your terminal** or source the new `.zshrc` file:

## Post-Installation
After setting up, you can further customize your ZSH environment using the Powerlevel10k configuration wizard and by editing your `.zshrc` and other Zsh configuration files.


