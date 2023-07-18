{ pkgs, ... }: {
	programs.gh = {
		enable = true;
		enableGitCredentialHelper = true;

		settings = {
			editor = "${pkgs.helix}/bin/neovim";

			git_protocol = "ssh";

			prompt = "enabled";
		};
	};
}
