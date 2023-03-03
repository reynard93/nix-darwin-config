{
	description = "My (cdmistman/colton) Nix config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs: let
	in {
		darwinConfigurations = {
			donn-mbp = import ./system/darwin.nix {
				inherit inputs;

				system = "aarch64-darwin";

				hm-config.users.colton = {
					home.username = "colton";

					programs.alacritty.enable = true;
					programs.vscode.enable = true;
				};
			};

			replit-mbp = import ./system/darwin.nix {
				inherit inputs;

				system = "aarch64-darwin";

				hm-config.users.colton = {
					home.username = "colton";

					programs.alacritty.enable = true;
					programs.vscode.enable = true;
				};
			};
		};

		nixosConfigurations = {
			coltons-replit-devvm-baby = import ./system/nixos.nix {
				inherit inputs;

				system = "x86_64-linux";

				hm-config.users.colton = {
					home.username = "colton";
				};
			};
		};
	};
}
