###############################################################################
## ZSH config
# zsh options
unsetopt autocd
unsetopt nomatch # `setopt extended_glob` already enabled but causes `HEAD^` in
                 # eg git commands to fail with a ZSH error. This fixes that
								 # see https://github.com/ohmyzsh/ohmyzsh/issues/449

# print empty line after every command
# https://github.com/starship/starship/issues/560#issuecomment-1318462079

# set vim keybinds
bindkey -v

# custom zfuncs dir
fpath+=(
	"$HOME/.zfuncs"
	{{#if dotter.packages.homebrew}}"$(brew --prefix)/share/zsh/site-functions"{{/if}}
)


# zsh-autocomplete config
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style complete-word
zstyle ':autocomplete:*' recent-dirs zoxide

## oh-my-zsh
# auto-update oh-my-zsh
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

plugins=(
	'deno'
	'direnv'
	'fnm'
	'gh'
	'git'
	'golang'
	'man'
	'ripgrep'
	'rust'
	'vi-mode'
	'zsh-autosuggestions'
	'zsh-syntax-highlighting'
)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

###############################################################################
## my shell config
# my aliases
alias k="clear"
alias fzf="sk"
alias ls="lsd"
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias lla="ls -la"
alias tree="lsd --tree"
alias cat="bat"

## initializations
# fnm
eval "$(fnm env --use-on-cd)"

# zoxide
eval "$(zoxide init zsh)"

# starship prompt - must be last
eval "$(starship init zsh)"
