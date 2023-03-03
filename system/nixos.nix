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

inputs.nixpkgs.lib.nixosSystem {
	inherit inputs pkgs system;

	modules = modules ++ [
		inputs.home-manager.nixosModules.home-manager

		./common.nix
		../users/colton

		{
			home-manager = hm-config;
		}
	];

	specialArgs = {
		inherit inputs pkgs;
	};
}
