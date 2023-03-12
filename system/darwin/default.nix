{
	modules ? [],
	inputs,
	system,
}:

inputs.darwin.lib.darwinSystem {
	inherit system;

	specialArgs = {
		inherit inputs system;
	};

	modules = modules ++ [
		./environment.nix
		./fonts.nix
		./system.nix
		./users/admin.nix
		./users/colton.nix

		inputs.home-manager.darwinModules.home-manager
		(args: {
			home-manager.users.colton = import ../../home/colton (args // {
				imports = [
					{
						home.sessionVariables = {
							# This can be set in NixOS configuration.nix, but not for darwin
							NIXPKGS_ALLOW_UNFREE = "1";
						};

						programs.vscode.enable = true;
					}
				];
			});
		})

		{
			nixpkgs.config.allowUnfree = true;

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
		}
	];
}
