{
  ...
}:
{
  programs.gh = {
    enable = true;
    settings.aliases = {
      co = "pr checkout";
      pv = "pr view";
    };
    settings.git_protocol = "ssh";
  };
}
