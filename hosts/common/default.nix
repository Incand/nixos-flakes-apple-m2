{ theme, font, ... }: {
  imports = [
    ./environment.nix
    ./locale.nix
    ./network.nix
    ./users.nix
  ];

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    extraSpecialArgs = { inherit theme font; };
    users.armin.imports = [ ../../home ];
  };

  nix = {
    gc.automatic = true;
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      tarball-ttl = 604800;
    };
  };

  # Polkit is needed for sway
  security.polkit.enable = true;

  # Some performance hacks? https://nixos.wiki/wiki/Sway
  security.pam.loginLimits = [
    { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
  ];

  security.pam.services.swaylock = { };

  services = {
    fstrim.enable = true;
    logind = {
      lidSwitch = "lock";
      lidSwitchDocked = "lock";
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
    };
    timesyncd.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    timeout = 2;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.dconf.enable = true;
}
