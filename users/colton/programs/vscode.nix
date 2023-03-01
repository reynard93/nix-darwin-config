{ pkgs, ... }: {
	programs.vscode = {
		package = pkgs.vscode;
	};
}
