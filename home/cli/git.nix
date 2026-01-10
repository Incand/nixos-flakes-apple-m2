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
    };
  };

  programs.zsh.shellAliases = {
    gs = "git status";

    ga = "git add";
    gap = "ga -p";

    gb = "git branch";
    gba = "git branch -a";
    gbd = "git branch -D";

    gch = "git checkout";
    gchb = "gch -b";

    gc = "git commit";
    gca = "gc --amend";
    gcan = "gca --no-edit";
    gcm = "gc -m";
    gcf = "gc --fixup";

    gcp = "git cherry-pick";
    gcpa = "gcp --abort";
    gcpc = "gcp --continue";

    gf = "git fetch";

    gl = "git log";
    glo = "git log --oneline";

    gr = "git rebase";
    grm = "gr origin/main";
    gri = "gr -i";
    grim = "gr -i origin/main";
    gra = "gr --abort";
    grc = "gr --continue";

    gst = "git stash";
    gstk = "gst -k";
    gstl = "gst --list";
    gstu = "gst -u";
    gstuk = "gstu -k";

    gp = "git push";
    gpf = "gp --force";
    gpu = "git push -u origin";

    gpl = "git pull";

    gd = "git diff";
    gdc = "gd --cached";
  };
}
