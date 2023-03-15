{
	home.file."$HOME/.config/zellij".text = ''
		scroll_buffer_size 100_000
		simplified_ui false
	'';

	programs.zellij = {
		enable = true;
	};
}
