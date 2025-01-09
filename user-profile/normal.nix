{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dust
  ];

  home.sessionVariables = {
    # LS-COLORS used by many programs (e.g. ls, fd, eza, dust, etc.)
    LS_COLORS = builtins.concatStringsSep ":" [
      "di=1;34" # directory: bold blue (1=bold, 34=blue)
      "ex=1;32" # executable: bold green (1=bold, 32=green)
      "fi=39" # regular file: default color (39=default foreground)
      "pi=33" # named pipe: yellow (33=yellow)
      "so=1;31" # socket: bold red (1=bold, 31=red)
      "bd=1;33" # block device: bold yellow (1=bold, 33=yellow)
      "cd=1;33" # character device: bold yellow (1=bold, 33=yellow)
      "ln=36" # symlink: cyan (36=cyan)
      "or=31" # broken symlink: red (31=red)
    ];
  };

  imports =
    builtins.map (path: ../packages/${path}) [
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
    ++ builtins.map (path: ../develop/${path}) [
      "julia"
      "latex"
      "nix"
      "python"
      "rust"
      "toml"
      "zed"
    ];
}
