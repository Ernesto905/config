# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
echo "Happy Hacking, $USER! 🚀"
# Determine the Homebrew prefix
if [[ -d "/opt/homebrew" ]]; then
    BREW_PREFIX="/opt/homebrew"
elif [[ -d "/usr/local" ]]; then
    BREW_PREFIX="/usr/local"
else
    echo "Homebrew not found"
    return
fi

source "$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Aliases
source ~/.zsh_aliases

# Vi mode
bindkey -v

# Add ~/bin to the beginning of the PATH
export PATH=~/bin:$PATH

# Enable prompt substitution and set a custom prompt
# %n: username, %m: hostname, %c: current directory, $(__git_ps1 " (%s)"): git branch info
setopt PROMPT_SUBST;PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

# Add ~/.zsh to the beginning of the function path
fpath=(~/.zsh $fpath)

# Initialize Zsh's completion system
autoload -Uz compinit && compinit

# Initialize pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# Add Homebrew to PATH
export PATH="$BREW_PREFIX/bin:$PATH"
