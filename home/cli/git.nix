{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "arminschaare@gmail.com";
        name = "Armin Schaare";
      };
      github.user = "Incand";
      init.defaultBranch = "main";
      alias = { };
    };
  };
}
