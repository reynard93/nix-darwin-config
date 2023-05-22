{
	pkgs,
	...
}: {
 homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "uninstall"; # uninstall removes manually install brews and casks
    brews = [
      "llvm"
      "rustup-init"
      "marksman"
      "fzf"
      "atuin"
      "git-delta"
      "lazygit"
			"chezmoi"# for my dotfiles
			"lima"
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
      {
        name = "sketchybar";
        args = [];
        restart_service = true;
      }
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
			"another-redis-desktop-manager"
			# "font-sf-mono-nerd-font-ligaturized"
			# "sf-symbols"
    ];
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/core"
      "homebrew/services"
      "koekeishiya/formulae"
    ];
  };
}
