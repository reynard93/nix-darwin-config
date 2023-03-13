{
	pkgs,
	...
}: {
	home = {
		enableNixpkgsReleaseCheck = true;
		stateVersion = "22.11";

		packages = with pkgs; [
			nil
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

			ls = "${pkgs.lsd}/bin/lsd -A --group-directories-first --hyperlink auto";
			l = "${pkgs.lsd}/bin/lsd -L";
			la = "${pkgs.lsd}/bin/lsd -a";
			ll = "${pkgs.lsd}/bin/lsd -l";
			lla = "${pkgs.lsd}/bin/lsd -al";

			tree = "${pkgs.lsd}/bin/lsd -L --tree";
		};
	};
}
