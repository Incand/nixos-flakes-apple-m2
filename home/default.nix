{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/vim.nix
    ./cli/zsh.nix

    ./desktop/adwaita-one-dark-gtk-theme
    ./desktop/firefox.nix
    ./desktop/fonts.nix
    ./desktop/gtk.nix
    ./desktop/i3status-rust.nix
    ./desktop/kitty.nix
    ./desktop/sway.nix
    ./desktop/rofi.nix
  ];

  home.packages = with pkgs; [
    bc
    evince
    htop
    pcmanfm
    thunderbird
  ];

  home.stateVersion = "24.11";
}
