local start_dir="$(pwd)"

################################################################################
## My Variables
export PATH="$HOME/bin:$PATH"
# set vim keybind
bindkey -v
# custom functions dir
local my_zfuncs_dir="$HOME/.zfuncs"
mkdir -p "$my_zfuncs_dir"
fpath+=("$m_zfuncs_dir")

alias k="clear"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lal="ls -al"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################################################################################
## package management
{{#if (and homebrew macos)}}
# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

{{/if}}
{{#if (and homebrew (not macos))}}
# homebrew
eval "$(/home/homebrew/.homebrew/brew shellenv)"

{{/if}}
{{#if asdf}}
# asdf - managed by oh-my-zsh's integrated asdf plugin
builtin_plugins+=("asdf")

{{/if}}
{{#if (not asdf)}}
# rust
local file="$HOME/.cargo/env"
[[ -r "$file" ]] && source "$file"

# node -- installed via fnm, usually installed via rust
[[ -n "$(which fnm)" ]] && eval "$(fnm env --use-on-cd)"

# golang - managed by gvm
local file="$HOME/.gvm/scripts/gvm"
[[ -r "$file" ]] && source "$file"

{{/if}}
################################################################################
## shell customizations
# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# install oh-my-zsh if it's not installed
if [[ ! -d "$ZSH" ]]; then
	mkdir tmp
	cd tmp
	curl -fsSl "https://raw.githubusercontent.com/ohmyzsh/master/tools/install.sh" -o "install.sh"
	sh install.sh --unattended --keep-zshrc
	cd "$start_dir"
	rm -d tmp
fi

# auto-update oh-my-zsh
zstyle ":omz:update" mode auto

# plugins
plugins+=(
	"github.com/marlonrichert/zsh-autocomplete"
	"github.com/zsh-users/zsh-syntax-highlighting"
)

# install plugins; update if installed
for idx in {1.."${#plugins}"}; do
	cd "$ZSH_CUSTOM/plugins"

	local repo="${plugins[$idx]}"
	local name="${repo##*/}"

	if [[ -d "$name" ]]; then
		cd "$name"
		printf "updating $name... "
		git pull --stat
	else
		printf "installing $name... "
		local res="$(git clone --depth 1 https://$repo -- $name 2>&1 1>/dev/null | /bin/cat)"
		if [[ "$?" == "0" ]]; then
			echo "ok"
		else
			echo "$res"
		fi
	fi

	plugins[$idx]="$name"
done
plugins+=(${builtin_plugins[@]})
cd "$start_dir"

source "$ZSH/oh-my-zsh.sh"

# starship
eval "$(starship init zsh)"
