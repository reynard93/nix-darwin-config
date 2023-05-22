{
	pkgs,
	...
}:
		let yabai = pkgs.yabai.overrideAttrs (old: rec {
			src = builtins.fetchTarball {
			url = https://github.com/koekeishiya/yabai/releases/download/v5.0.5/yabai-v5.0.5.tar.gz;
			sha256 = "0yll7f708ibx3r33bj2jyin8yr39jj7fgfxfsmj8i22857k0w3py";
		 };
		}); in {
	services = {
		nix-daemon.enable = true;
		yabai = {
        enable = true;
        enableScriptingAddition = true;
        package = yabai;
        config = {
          focus_follows_mouse = "autofocus";
          layout = "bsp";
          split_ratio = 0.5;
          auto_balance = "off";
          top_padding = 5;
          bottom_padding = 5;
          left_padding = 5;
          right_padding = 5;
          window_gap = 5;
          window_placement = "second_child";
          extraConfig = ''
						yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
						sudo yabai --load-sa
            yabai -m rule --add label="licecap" app="^licecap$" manage=off sticky=on
            yabai -m rule --add label="df" app="^dwarfort.exe$" manage=off
            yabai -m signal --add event=application_activated app="^(licecap|zoom.us)$" action="yabai -m config focus_follows_mouse off"
            yabai -m signal --add event=application_deactivated app="^(licecap|zoom.us)$" action="yabai -m config focus_follows_mouse autofocus"

            # Sticky floating windows
            yabai -m rule --add label="preferences" app="^(System Settings|System Preferences|Fantastical 2)$" manage=off sticky=on
          '';
        };
      };
      skhd = {
          enable = true;
          package = pkgs.skhd;
          # https://github.com/koekeishiya/skhd/blob/master/examples/skhdrc
          # https://github.com/koekeishiya/skhd/issues/1
          skhdConfig = ''
            # move focused window
            cmd + ctrl - h : yabai -m window --warp west
            cmd + ctrl - j : yabai -m window --warp south
            cmd + ctrl - k : yabai -m window --warp north
            cmd + ctrl - l : yabai -m window --warp east

            # toggle window properties
            cmd + ctrl - o : yabai -m window --toggle zoom-fullscreen
            cmd + ctrl - f : yabai -m window --toggle float

            # flip axes
            cmd + ctrl - y : yabai -m space --mirror y-axis
            cmd + ctrl - x : yabai -m space --mirror x-axis

            # resize
            cmd + ctrl + shift - space : yabai -m space --balance
            cmd + ctrl + shift - j : yabai -m window --resize top:0:100 ; \
                                     yabai -m window --resize bottom:0:100
            cmd + ctrl + shift - k : yabai -m window --resize bottom:0:-100 ; \
                                     yabai -m window --resize top:0:-100
            cmd + ctrl + shift - h : yabai -m window --resize left:-250:0 ; \
                                     yabai -m window --resize right:-250:0
            cmd + ctrl + shift - l : yabai -m window --resize right:250:0 ; \
                                     yabai -m window --resize left:250:0

            # move to space
            cmd + ctrl - right : yabai -m window --space next ; \
                                 yabai -m space  --focus next
            cmd + ctrl - left  : yabai -m window --space prev ; \
                                 yabai -m space  --focus prev

            # move to display
            cmd + alt + ctrl - right : yabai -m window --display next
            cmd + alt + ctrl - left  : yabai -m window --display prev

            # fix accidental three-column layout, revert to BSP
            # https://github.com/koekeishiya/yabai/issues/658
            cmd + ctrl - p : yabai -m window --toggle split
          '';
        };
	};
}
