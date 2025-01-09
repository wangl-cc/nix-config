{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    taplo
  ];

  programs.zed-editor = {
    extensions = [ "toml" ];
    userSettings.lsp.taplo.binary.path = "${pkgs.taplo}/bin/taplo";
  };
}