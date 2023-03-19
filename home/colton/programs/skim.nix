{ pkgs, ... }: {
	programs.skim = {
		enable = true;
		enableBashIntegration = true;
		enableZshIntegration = true;

		defaultCommand = "${pkgs.fd}/bin/fd --type f || find .";
		defaultOptions = [
			"--preview '${pkgs.bat}/bin/bat --color=always --line-range=:500 {}'"
		];
	};
}
