{ config, pkgs, theme, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs: [
      (rofi-calc.override {
        rofi-unwrapped = rofi-wayland-unwrapped;
      })
    ];
    extraConfig = {
      modi = "drun,window,combi";
      combi-modi = "drun,window";
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
      display-window = "";
      display-combi = "";
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        font = theme.font;
        text-color = theme.foreground;
        background-color = theme.background;
        border-color = theme.background;
      };
      "window" = {
        anchor = mkLiteral "northeast";
        location = mkLiteral "north";
        y-offset = mkLiteral "24px";
        width = mkLiteral "50%";
        padding = mkLiteral "4px";
        children = mkLiteral [ horibox ];
      };
      "horibox" = {
        orientation = mkLiteral "vertical";
        children = mkLiteral "[ entry, listview ]";
      };
      "listview" = {
        layout = mkLiteral "vertical";
        spacing = mkLiteral "5px";
        lines = mkLiteral "20";
      };
      "entry" = {
        expand = false;
        width = mkLiteral "10em";
      };
      "element" = {
        padding = mkLiteral "0px 2px";
      };
      "element selected" = {
        text-color = theme.background;
        background-color = theme.foreground;
      };
    }; 
  };
}
