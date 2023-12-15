# TMUX Configuration README

This README provides instructions for setting up TMUX on your system.

## Installation Steps

1. **Install Tmux**
   - For macOS, you can use Homebrew:
     ```bash
     brew install tmux
     ```

2. **Install Tmux Package Manager**
   - Clone the TPM (Tmux Plugin Manager) repository into the default TPM path:
     ```bash
     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
     ```

3. **Install Plugins**
   - Start a new TMUX session:
     ```bash
     tmux
     ```
   - Press `CTRL-A` (or your configured prefix key) followed by `Shift + I` to fetch and install the plugins listed in your `.tmux.conf` file.

After these steps, your TMUX environment will be set up with the plugins specified in your configuration.
