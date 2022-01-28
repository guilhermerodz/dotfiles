# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
# Add Homebrew completions
FPATH=$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:$FPATH
