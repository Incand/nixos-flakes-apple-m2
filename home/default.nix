{ pkgs, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/vim.nix
    ./cli/zsh.nix

    ./desktop/firefox.nix
    ./desktop/fonts.nix
    ./desktop/godot_4-mono.nix
    ./desktop/gtk.nix
    ./desktop/jetbrains.nix
    ./desktop/i3status-rust.nix
    ./desktop/kitty.nix
    ./desktop/rofi.nix
    ./desktop/runelite.nix
    ./desktop/sway.nix
  ];

  home.packages = with pkgs; [
    bc
    evince
    htop
    pcmanfm
    python3
    thunderbird
  ];

  home.stateVersion = "24.11";
}
