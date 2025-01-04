{
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Loong";
    userEmail = "wangl.cc@outlook.com";
    signing = {
      signByDefault = true;
      key = "104112FBDC0450E0";
    };
    extraConfig = {
      log.mailmap = true;
      mailmap.file = "${config.xdg.configHome}/git/mailmap";
    };
    ignores = import ./ignores.nix;
  };

  programs.fish.shellAbbrs = {
    g = "git";
    ga = "git add";
    gaa = "git add --all";
    gb = "git branch";
    gba = "git branch -a";
    gbd = "git branch -d";
    gbl = "git branch -l";
    gc = "git commit";
    gcl = "git clone";
    gco = "git checkout";
    gcb = "git checkout -b";
    gcm = "git checkout main";
    gci = "git check-ignore -v";
    gd = "git diff";
    gds = "git diff --staged";
    gl = "git log";
    gp = "git push";
    gpt = "git push --tags";
    gpl = "git pull --ff-only"; # fast-forward only to prevent merge commit
    gr = "git remote";
    grv = "git remote -v";
    gra = "git remote add";
    gs = "git status";
    gsu = "git status -u";
    gt = "git tag";
  };

  xdg.configFile."git/mailmap".source = ./mailmap;
}
