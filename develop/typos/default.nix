{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    typos
    typos-lsp
  ];

  programs.zed-editor = {
    extensions = [ "typos" ];
    userSettings.lsp.typos-lsp.binary.path = "${pkgs.typos-lsp}/bin/typos-lsp";
  };
}
