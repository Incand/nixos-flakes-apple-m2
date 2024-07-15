{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    font-awesome
    terminus_font
    terminus_font_ttf
  ];
}
