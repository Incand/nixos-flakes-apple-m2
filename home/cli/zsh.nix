{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    profileExtra = ''
      [[ "$(tty)" == /dev/tty1 ]] && exec sway
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "docker-compose" ];
      theme = "robbyrussell";
    };

    initContent = ''
      bindkey '^f' autosuggest-accept
    '';
  };
}
