{
	pkgs,
	...
}: {
 homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "none"; # uninstall removes manually install brews and casks
    brews = [
      "neovim"
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
			"automake" # emacs pdf tools
			"poppler" # emacs pdf tools
			"pandoc" # emacs pdf tools

      # {
      #   name = "emacs-plus@30";
      #   args = ["with-dragon-icon"];
      #   link = true;
      # }
      {
        name = "yabai";
        args = [];
        restart_service = true;
      }
      {
        name = "skhd";
        args = [];
        restart_service = true;

      "sketchybar"
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
			"temurin"
			"temurin8"

      # fonts
      "font-hack-nerd-font"
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
