{
	description = "My Nix config";

	inputs = {
		# TODO: use nixos/nixpkgs-unstable, have to wait for starship 1.15.0
		# to release, likely in June
		# nixpkgs.url = "github:cdmistman/nixpkgs";
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		devenv.url = "github:cachix/devenv/latest";

		home-manager = {
			url = "github:cdmistman/home-manager/nushell-add-login-file";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		mkAlias = {
			url = "github:reckenrode/mkAlias";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs @ {
		home-manager,
		nixpkgs,
		...
	}: {
		darwinConfigurations = {
			r-lee-QH0KG = import ./system/darwin {
				inherit inputs;
				inherit home;

				system = "aarch64-darwin";

				modules = [
					{
						networking.computerName = "ReynardLee MacBook Pro";
						networking.hostName = "r-lee-QH0KG";
					}
				];
			};
		};
	};
}
