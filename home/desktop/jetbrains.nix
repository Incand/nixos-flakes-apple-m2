{ pkgs, lib, ... }: let
  ides = with pkgs.jetbrains; [
    idea-community
    rider
    rust-rover
  ];
  pluginList = [ "ideavim" ];
in {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "rider"
    "rider-with-plugins"
    "rust-rover"
    "rust-rover-with-plugins"
  ];

  home.packages = with pkgs.jetbrains.plugins; lib.lists.forEach ides (ide:
    pkgs.jetbrains.plugins.addPlugins ide pluginList
  );
}

