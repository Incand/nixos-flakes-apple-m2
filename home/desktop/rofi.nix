{ config, pkgs, theme, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
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
        font = "${theme.font} Bold 20";
        text-color = mkLiteral "#${theme.foreground}";
        background-color = mkLiteral "#${theme.background}";
        border-color = mkLiteral "#${theme.color8}";
      };
      "window" = {
        anchor = mkLiteral "northwest";
        location = mkLiteral "northwest";
        y-offset = mkLiteral "0px";
        width = mkLiteral "38%";
        height = mkLiteral "38%";
        padding = mkLiteral "4px";
        children = mkLiteral "[ horibox ]";
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
        spacing = mkLiteral "16px";
      };
      "element selected" = {
        text-color = theme.background;
        background-color = theme.foreground;
      };
    }; 
  };
}
