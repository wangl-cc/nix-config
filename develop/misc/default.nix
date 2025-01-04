{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    markdownlint-cli2
    nodejs
    typos
  ];
}
