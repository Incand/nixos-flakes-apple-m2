{ config, pkgs, ... }: {
  networking.wireless.iwd = {
    enable = true;
    settings.Settings.AutoConnect = true;
  };

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
}
