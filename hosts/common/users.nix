{ pkgs, ... }: {
  programs.zsh.enable = true;
  users.users.armin = {
    extraGroups = [ "wheel" "audio" "video" "render" "input" ];
    initialPassword = "pw123";
    isNormalUser = true;

    shell = pkgs.zsh;
  };
}
