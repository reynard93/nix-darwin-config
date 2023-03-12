{
	inputs,
	pkgs,
	...
}: {
	users.users.colton = {
		createHome = false;

		description = "Colton Donnelly";

		home = "/Users/colton";

		isHidden = false;

		packages = [
			inputs.home-manager
		];
	};
}
