{ pkgs, lib, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batgrep
    ];
    themes =
      # Catppuccino themes for bat
      lib.genAttrs
        [
          "frappe"
          "latte"
          "macchiato"
          "mocha"
        ]
        (
          themeName:
          let
            inherit (lib) toUpper substring stringLength;
            mkUpper = str: (toUpper (substring 0 1 str)) + (substring 1 (stringLength str) str);
          in
          {
            src = pkgs.fetchFromGitHub {
              owner = "catppuccin";
              repo = "bat";
              rev = "699f60fc8ec434574ca7451b444b880430319941";
              sha256 = "6fWoCH90IGumAMc4buLRWL0N61op+AuMNN9CAR9/OdI=";
            };
            file = "themes/Catppuccin ${mkUpper themeName}.tmTheme";
          }
        );
  };

  # use bat as the default pager for gh
  programs.gh.settings.pager = "bat";
  # use bat as fzf previewer
  programs.fzf.fileWidgetOptions = [
    "--preview 'bat --color=always --style=header,grid --line-range :300 {}'"
  ];
}
