{ pkgs, ... }: {
	programs.vscode = {
		# don't auto-enable vscode, as it's a GUI app and
		# my config should work when headless
		package = pkgs.vscode;

		enableUpdateCheck = false;
	};
}
