# Determine the Homebrew prefix
if [[ -d "/opt/homebrew" ]]; then
    BREW_PREFIX="/opt/homebrew"
elif [[ -d "/usr/local" ]]; then
    BREW_PREFIX="/usr/local"
else
    echo "Homebrew not found"
    return
fi


eval "$($BREW_PREFIX/bin/brew shellenv)"
