# Oh my Zsh setup 
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-syntax-highlighting you-should-use zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
source ~/.zsh_aliases

eval "$(/opt/homebrew/bin/brew shellenv)"

# Vi mode 
bindkey -v


