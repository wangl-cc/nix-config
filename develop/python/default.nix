{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    uv
    pyright
    ruff
  ];

  programs.zed-editor = {
    extensions = [ "ruff" ];
    userSettings.languages.Python = {
      tab_size = 4;
      language_servers = [
        "pyright"
        "ruff"
      ];
      formatter = [
        {
          code_actions = {
            # The quotes are necessary to prevent the key be expanded as an attribute set
            "source.organizeImports.ruff" = true;
            "source.fixAll.ruff" = true;
          };
        }
        { language_server.name = "ruff"; }
      ];
    };
    userSettings.lsp = {
      pyright.binary.path = "${pkgs.pyright}/bin/pyright";
      ruff.binary.path = "${pkgs.ruff}/bin/ruff";
    };
  };
}
