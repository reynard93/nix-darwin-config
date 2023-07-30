{
	pkgs,
	...
}: {
 homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap"; # uninstall removes manually install brews and casks
    brews = [
      "neovim"
      "lazygit"
      "llvm"
      "rustup-init"
      "fzf"
      "atuin"
      "git-delta"
			"lima"
			"efm-langserver"
      "yaml-language-server"
			# "findutils" # for locate to work, note commands are glocate and gupdatedb
			"enchant"# emacs jinx
			"deno"# emacs lsp
      "pyenv"
			"automake" # emacs pdf tools
			"poppler" # emacs pdf tools
			"pandoc" # emacs pdf tools
      "cmake" # emacs vterm
      "ispell" # another emacs dep
      "hunspell" # roy emacs require
      "fd" # emacs faster fd, havent configure yet set-find-program?
      "exa" # required for dirvish
      "sbcl" # required for sly, rmbr to customize-set-variable 'inferior-lisp-program

      "ripgrep" # emacs dep, faster grep

      "yabai"
      "skhd"

			"maven"
      "lf" # file mgr
      "fd"# better find
      "chezmoi" # manage dots
    ];
    # i don't know why this doesnt work
    casks = [
      # multimedia
      # "spotify"
      "warp"
      # extra browsers
      "firefox"
			"temurin"
			"temurin8"

      # fonts
      "font-hack-nerd-font" # required for sketchybar?
      "font-jetbrains-mono"
      "sf-symbols" #required by sketchybar
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-versions"
      "homebrew/cask-drivers"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae"
      "FelixKratz/formulae"
    ];
  };
}
