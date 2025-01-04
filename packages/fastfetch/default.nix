{
  ...
}:
{
  programs.fastfetch = {
    enable = true;
    settings.logo = "auto";
    settings.modules = [
      "title"
      "separator"
      "os"
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "terminal"
      "terminalfont"
      "cpu"
      "gpu"
      "memory"
      "locale"
      "break"
      "colors"
    ];
  };

  programs.fish.shellAbbrs = {
    ff = "fastfetch";
  };
}
