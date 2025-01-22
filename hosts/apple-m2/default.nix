{ apple-silicon, ... }: {
  imports = [
    ../common
    ./hardware.nix
    apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    apple-silicon.overlays.apple-silicon-overlay
    (final: prev: { mesa = final.mesa-asahi-edge; })
  ];

  hardware = {
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "driver";
      withRust = true;
    };
    graphics.enable = true;
  };

  boot = {
    # consoleLogLevel = 0;
    kernelParams = [ "apple_dcp.show_notch=1" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };

  networking.hostName = "nixos-apple-m2";
  system.stateVersion = "24.11";
}
