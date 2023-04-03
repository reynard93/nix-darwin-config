{
	pkgs,
	...
}: {
	environment = {
		loginShell = "/bin/zsh";

		shells = with pkgs; [
			nushell
		];

		systemPackages = with pkgs; [
			cachix
			nushell
		];
	};
}
