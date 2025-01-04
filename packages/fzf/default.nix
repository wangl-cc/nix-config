{
  ...
}:
{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--color=16" # use base 16 colors to always match the terminal colors
      "--height=40%" # show 40% of the screen height
      "--border" # no border
    ];
  };
}
