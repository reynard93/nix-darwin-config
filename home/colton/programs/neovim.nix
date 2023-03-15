# { pkgs, ... }:
{
	programs.neovim = {
		enable = true;

		defaultEditor = true;

		# plugins = with pkgs.vimPlugins; [
		# 	nvim-treesitter.withPlugins(_: nvim-treesitter.allGrammars)
		# ];

		vimAlias = true;
		vimdiffAlias = true;
	};
}
