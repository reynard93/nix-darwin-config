{ inputs, ... }: {
	home-manager = {
		backupFileExtension = "bak";
		useGlobalPkgs = false;
		useUserPackages = true;
	};

	programs.bash.enable = true;
	programs.zsh.enable = true;
}
