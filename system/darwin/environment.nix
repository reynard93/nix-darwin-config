{
	pkgs,
	...
}: {
	environment = {
		loginShell = "/bin/zsh";
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
		systemPackages = with pkgs; [
			cachix
			nix-prefetch
		];
	};
}
