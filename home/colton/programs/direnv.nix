{
	programs.direnv = {
		enable = true;
		enableBashIntegration = true;
		enableZshIntegration = true;

		nix-direnv.enable = true;

		config.global = {
			warn_timeout = "1m";
		};

		config.whitelist.prefix = [
			"/Users/colton/github.com/cdmistman"
			"/home/colton/github.com/cdmistman"
		];
	};
}
