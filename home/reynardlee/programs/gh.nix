{ pkgs, ... }: {
	programs.gh = {
		enable = true;
		enableGitCredentialHelper = true;

		settings = {
			editor = "${pkgs.neovim}/bin/neovim";

			git_protocol = "ssh";

			prompt = "enabled";
		};
	};
}
