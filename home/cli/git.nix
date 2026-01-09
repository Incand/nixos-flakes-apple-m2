{ ... }: {
  programs.git = {
    enable = true;
    ignores = ["shell.nix"];
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
