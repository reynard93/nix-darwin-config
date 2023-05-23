{
	pkgs,
	...
}: {
	environment = {
		loginShell = "/bin/zsh";

		shells = with pkgs; [
			nushell
		];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
		systemPackages = with pkgs; [
			cachix
			nushell
			nix-prefetch
			skhd
		];
	};
}
