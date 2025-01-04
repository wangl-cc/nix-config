{ ... }:
{
  programs.lazygit = {
    enable = true;
  };

  programs.fish.shellAbbrs.gg = "lazygit";
}
