{
  pkgs,
  ...
}:
{
  # juliaup is not available on nix, so use julia is fine
  home.packages = with pkgs; [
    julia-bin # use julia-bin instead of julia
  ];

  programs.fish.shellAbbrs = {
    jl = "julia";
    jp = "julia --project";
  };
}
