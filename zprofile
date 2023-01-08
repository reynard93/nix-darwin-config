export EDITOR='nvim'
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export PAGER='bat'
export SKIM_DEFAULT_COMMAND='fd --type f || find .'
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

export PATH="$HOME/bin:$PATH"

{{#if dotter.packages.homebrew}}eval "$(/opt/homebrew/bin/brew shellenv)"{{/if}}

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"
[[ -f "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh"
