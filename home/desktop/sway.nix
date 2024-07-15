{ lib, pkgs, theme, ... }: {
  home.packages = with pkgs; [ dmenu rofi light swaylock swayidle ];

  wayland.windowManager.sway = {
    enable = true;
    config = let
      swaylockCmd = "swaylock -f -c 000000 --font ${theme.font}";
    in rec {
      modifier = "Mod4";
      terminal = "kitty";
      defaultWorkspace = "workspace number 1"; 


      input = {
        "type:keyboard" = {
          xkb_layout = "us,de";
          xkb_options = "ctrl:nocaps,grp:alt_space_toggle";
          repeat_delay = "200";
          repeat_rate = "30";
        };
      };

      startup = [
        {
          command = ''
            ${lib.getExe pkgs.swayidle} -w \
              timeout 180 '${swaylockCmd}' \
              before-sleep '${swaylockCmd}'
          '';
          always = true;
        }
        {
          command = "${lib.getExe pkgs.swaybg} -c '#000000'";
          always = true;
        }
      ];

      keybindings = let
        mod = "Mod4";
        concatAttrs = lib.fold (x: y: x // y) { };
        tagBinds = concatAttrs (map (i: {
          "${mod}+${toString i}" = "exec 'swaymsg workspace ${toString i}'";
          "${mod}+Shift+${toString i}" =
            "exec 'swaymsg move container to workspace ${toString i}'";
        }) (lib.range 1 9));
      in tagBinds // {
        # "${mod}+o" = "exec ${lib.getExe pkgs.hyprpicker} -a -n";
        "${mod}+0" = "exec ${swaylockCmd}";

        "${mod}+Return" = "exec kitty";
        "${mod}+d" = "exec dmenu_run";

        "XF86AudioMute" = "exec ${pkgs.alsa-utils}/bin/amixer sset Master toggle";
        "XF86AudioRaiseVolume" = "exec ${pkgs.alsa-utils}/bin/amixer sset Master 5%+";
        "XF86AudioLowerVolume" = "exec ${pkgs.alsa-utils}/bin/amixer sset Master 5%-";

        "${mod}+XF86AudioRaiseVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 1%+";
        "${mod}+XF86AudioLowerVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 1%-";

        # "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
        # "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
        # "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";

        "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.brightnessctl} s 5%-";
        "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.brightnessctl} s 5%+";

        "${mod}+XF86MonBrightnessDown" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%-";
        "${mod}+XF86MonBrightnessUp" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%+";

        "${mod}+r" = ''mode "resize"'';
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+Shift+s" = "sticky toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        "${mod}+a" = "focus parent";
        "${mod}+v" = "splitv";
        "${mod}+c" = "splith";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+q" = "kill";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
      };

      bars = [{
        position = "top";
        statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        fonts = {
          names = [ theme.font "FontAwesome6Free" ];
          style = "Bold Semi-Condensed";
          size = 20.0;
        };
      }];
      window = {
        hideEdgeBorders = "smart";
        titlebar = false;
      };

      seat = { "*".hide_cursor = "when-typing enable"; };
      output = { "eDP-1".scale = "1"; };
    };
  };
}
