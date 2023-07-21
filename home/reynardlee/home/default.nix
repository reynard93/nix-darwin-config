{
	enableGUI,
	inputs,
	pkgs,
	system,
	...
}: {
	home = {
		file = import ./files.nix;

		enableNixpkgsReleaseCheck = true;
		stateVersion = "22.11";
		username = "reynardlee";

		packages = with pkgs; [
			inputs.devenv.packages.${system}.devenv

			# warning the docker here is interfering with docker-desktop alrdy installed maybe
			# docker
			du-dust
			fd
			jless
			jq
			nil
			procs
			ripgrep
			sd
			tokei
			nurl

			# Rust
			rustup

			nodePackages.graphite-cli
		] ++ (if !enableGUI then [] else with pkgs; [
			discord
			element-desktop
			telegram
		]);

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
			ownsh = "cd /Users/reynardlee/bin";
			lg = "lazygit";
			gcm = "git commit -m";
			ga = "git add .";
			emacs = "~/Applications/Emacs.app/Contents/MacOS/Emacs";
		};
	};
}
