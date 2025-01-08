{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
  ];

  programs.zed-editor = {
    extensions = [ "nix" ];
    userSettings.languages.Nix = {
      language_servers = [ "nixd" ];
    };
  };
}
