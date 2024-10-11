{ pkgs, theme, ... }:
let is_dark = if theme.type == "dark" then 1 else 0;
in {
  gtk = {
    enable = true;
    font = {
      name = "FiraCode";
      size = 20;
    };
    gtk2.configLocation = "/home/armin/.config/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = is_dark;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = is_dark;
  };
  xdg.configFile."gtk-3.0/gtk.css".text = ''
    window decoration {
      box-shadow: none;
    }

    .titlebar,
    .titlebar .background {
      border-radius: 0px 0px 0px 0px;
    }
  '';
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    gtk.enable = true;
    size = 40;
  };
}
