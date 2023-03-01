{
	hm-config,
	inputs,
	modules ? [],
	system,
}:

let
	pkgs = import inputs.nixpkgs {
		inherit system;

		config.allowUnfree = true;
	};
in

inputs.darwin.lib.darwinSystem {
	inherit inputs pkgs system;

	modules = modules ++ [
		inputs.home-manager.darwinModules.home-manager

		./common.nix
		../users/colton

		{
			home-manager = hm-config;

			programs.nix-index.enable = true;

			services.nix-daemon.enable = true;

			system.defaults = {
				dock = {
					autohide = true;
					tilesize = 40;
				};

				finder = {
					AppleShowAllFiles = true;

					CreateDesktop = true;

					ShowPathbar = true;
					ShowStatusBar = true;
				};

				NSGlobalDomain = {
					AppleInterfaceStyle = null;
					AppleShowAllFiles = true;
					AppleShowScrollBars = "WhenScrolling";

					NSDocumentSaveNewDocumentsToCloud = false;
				};

				trackpad = {
					Clicking = true;
					TrackpadThreeFingerDrag = false;
				};
			};

			system.keyboard = {
				enableKeyMapping = true;
				remapCapsLockToEscape = true;
			};
		}
	];

	specialArgs = {
		inherit inputs pkgs;
	};
}
