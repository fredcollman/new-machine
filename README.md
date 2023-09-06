# New machine

This repo aims to give full step-by-step instructions (automated as much as possible) to set up a new development machine.
Parts can be skipped by commenting them out.

## Instructions

1. Download the repo (TODO: add a one liner that does this via curl or similar)
2. Set variables: cp config/variables.sample config/variables and edit
3. scripts/install
4. config/run
5. Set up zsh (TODO)

## OS-specific

If running on Windows, you might need to make sure that line endings are configured appropriately:

```sh
git config --global core.autocrlf true
```

## Examples of home directory dotfiles

```sh
# .zshenv
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
export DEBUG_SOURCED_HOME_ZSHRC="~/.zshrc at $(date -Is)"


eval "$(starship init zsh)"

# pnpm overrides for muscle memory
alias y="pnpm"
alias y+="pnpm add"
alias yd="pnpm add --save-dev"
```

```sh
# .zshrc
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
export DEBUG_SOURCED_HOME_ZSHRC="~/.zshrc at $(date -Is)"


eval "$(starship init zsh)"

# pnpm overrides for muscle memory
alias y="pnpm"
alias y+="pnpm add"
alias yd="pnpm add --save-dev"
```

```sh
# .zprofile
BM_HELLO_NOEXPORT=hello
export BM_HELLO_EXPORT=hello
```
