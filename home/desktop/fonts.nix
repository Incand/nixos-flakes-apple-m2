{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    dejavu_fonts
    font-awesome
    terminus_font
    terminus_font_ttf
  ];
}
