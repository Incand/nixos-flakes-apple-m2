{ ... }: {
  programs.git = {
    enable = true;
    userName = "Armin Schaare";
    userEmail = "arminschaare@gmail.com";
    extraConfig = {
      github.user = "Incand";
      init.defaultBranch = "main";
      alias = { };
    };
  };
}
