{
	pkgs,
	...
}: {
	environment = {
		loginShell = "/bin/zsh";

		systemPackages = with pkgs; [
			du-dust
			fd
			home-manager
			neovim
			procs
			ripgrep
			sd
		];
	};
}
