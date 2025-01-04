{ ... }:
{
  imports =
    builtins.map (path: ../../packages/${path}) [
      "atuin"
      "bat"
      "delta"
      "eza"
      "fastfetch"
      "fd"
      "fish"
      "fzf"
      "gh"
      "git"
      "gnupg"
      "lazygit"
      "neovim"
      "pinentry-mac"
      "ripgrep"
      "starship"
      "zoxide"
    ]
    ++ builtins.map (path: ../../develop/${path}) [
      "julia"
      "latex"
      "misc"
      "nix"
      "python"
      "rust"
    ];
}
