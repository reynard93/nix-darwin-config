{
	programs.direnv = {
		enable = true;
		enableBashIntegration = true;
		enableNushellIntegration = true;
		enableZshIntegration = true;

		# nix-direnv.enable = true;

		config.global = {
			warn_timeout = "1m";
		};
	};
}
