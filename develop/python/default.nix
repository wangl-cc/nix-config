{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    uv
    ruff
    pyright
    pkg-config # some packages need this to build
  ];
}
