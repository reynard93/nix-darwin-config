{
	modules ? [],
	inputs,
	system,
	lib,
}:

inputs.darwin.lib.darwinSystem {
	inherit system;

	pkgs = inputs.nixpkgs.legacyPackages.${system};

	specialArgs = {
		inherit inputs system;
	};

	modules = modules ++ [
		../../cachix

		./environment.nix
		./fonts.nix
		./system.nix
		./homebrew.nix

		./scripts/aliasApplications.nix
		./users/reynardlee.nix
		./users/admin.nix

		inputs.home-manager.darwinModules.home-manager
		{
			home-manager.extraSpecialArgs = {
				inherit inputs system;

				enableGUI = true;
			};

			home-manager.sharedModules = [
				../../home/common
			];

			home-manager.users.reynardlee = lib.mkMerge [
				(../../home/reynardlee)
				{
					imports = [
						./yabai.nix
					];
				}
			];
		}

		{
			nix.settings = {
				auto-optimise-store = true;

				experimental-features = "nix-command flakes";
				extra-nix-path = "nixpkgs=flake:nixpkgs";

				sandbox = true;

				trusted-users = [ "root" "reynardlee" ];
			};

			programs.bash.enable = true;
			programs.zsh = {
				enable = true;

				# for some reason, i'm not getting this in my shell init.
				loginShellInit = ''
					if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
						. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
					fi
				'';
			};

			security.pam.enableSudoTouchIdAuth = true;

			services.nix-daemon.enable = true;
			#	https://github.com/koekeishiya/skhd/issues/267
			services.activate-system.enable = true; # this might be the launchd thing reqd for yabai/skhd etc to run
		}
	];
}
