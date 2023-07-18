{
	pkgs,
	...
}: {
 homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "none"; # uninstall removes manually install brews and casks
    brews = [
      "llvm"
      "rustup-init"
      "marksman"
      "fzf"
      "atuin"
      "git-delta"
			"lima"
			"efm-langserver"
			# "findutils" # for locate to work, note commands are glocate and gupdatedb
			"enchant"# emacs jinx
			"deno"# emacs lsp
			"automake" # emacs pdf tools
			"poppler" # emacs pdf tools
			"pandoc" # emacs pdf tools
			# for ricing
		  {
        name = "yabai";
        args = [];
        restart_service = true;
      }
      {
        name = "skhd";
        args = [];
        restart_service = true;
      }
			"maven"
    ];
    # i don't know why this doesnt work
    casks = [
      # multimedia
      # "spotify"
      "vlc"

      # extra browsers
      "firefox"
      # "tor-browser"

      # social
			# "telegram"

      # network
      # "protonvpn"
      # "transmission"

      # system tweaks
      # "karabiner-elements"
      # "flameshot"

      # other
      # "appcleaner"
			# "font-sf-mono-nerd-font-ligaturized"
			# "sf-symbols"
			"temurin"
			"temurin8"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-versions"
      "homebrew/cask-drivers"
      "homebrew/core"
      "homebrew/services"
#      "koekeishiya/formulae"
    ];
  };
}
