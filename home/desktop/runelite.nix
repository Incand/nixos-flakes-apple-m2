{ pkgs, ... }: {
  nixpkgs.config.allowUnsupportedSystem = true;

  home.packages = [ pkgs.runelite ];
}

