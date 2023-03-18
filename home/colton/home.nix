{
	pkgs,
	...
}: {
	home = {
		enableNixpkgsReleaseCheck = true;
		stateVersion = "22.11";
		username = "colton";

		packages = with pkgs; [
			discord
			du-dust
			fd
			jless
			jq
			nil
			procs
			ripgrep
			sd
			tokei
		];

		sessionPath = [
			"$HOME/bin"
		];

		sessionVariables = {
			MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";

			PAGER = "${pkgs.bat}/bin/bat";
		};

		shellAliases = {
			k = "clear";
			kn = "clear && printf '\\e[3J'";

			ls = "${pkgs.lsd}/bin/lsd -AL --group-directories-first";
			l = "ls";
			la = "ls -a";
			ll = "ls -l";
			lla = "ls -al";
			tree = "ls --tree";
		};
	};
}
