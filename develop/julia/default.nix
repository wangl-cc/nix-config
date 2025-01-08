{
  pkgs,
  ...
}:
let
  julia = pkgs.julia-bin;
in
{
  # juliaup is not available on nix, so use julia is fine
  home.packages = [ julia ];

  programs.fish.shellAbbrs = {
    jl = "julia";
    jp = "julia --project";
  };

  programs.zed-editor = {
    extensions = [ "julia" ];
    userSettings.languages.Julia = {
      tab_size = 4;
      preferred_line_length = 92;
      wrap_guides = [ 92 ];
    };
  };
}
