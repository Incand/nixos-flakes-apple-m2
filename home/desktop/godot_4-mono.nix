{ pkgs, ... }: {
  nixpkgs.config.permittedInsecurePackages = [ "dotnet-sdk-6.0.428" ];

  home.packages = [ pkgs.godot_4-mono ];
}
