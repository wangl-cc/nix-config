# Setup fish shell and some friends
{ ... }:
{
  # User specific configuration
  programs.fish = {
    enable = true;
    functions = {
      expand_dot = ''
        string repeat -n (math (string length -- $argv[1]) - 1) ../
      '';
    };
    preferAbbrs = true;
    shellAbbrs = {
      # expand multiple dots
      dots = {
        regex = "^\\.\\.+$";
        function = "expand_dot";
      };
      # rm
      rm = "rm -i";
      rf = "rm -f";
      # nix
      nr = "nix run";
      nrp = {
        expansion = "nix run nixpkgs#%";
        setCursor = true;
      };
      # show differeces between home-manager generations
      ndh = "nix profile diff-closures --profile ~/.local/state/nix/profiles/home-manager";
    };
    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      function fish_user_key_bindings
          fish_default_key_bindings -M insert # set default key bindings for insert mode
          # then execute the vi-bindings so they take precedence when there's a conflict.
          fish_vi_key_bindings --no-erase insert
      end
      set fish_cursor_default block
      set fish_cursor_insert line
      set fish_cursor_replace underscore
      set fish_cursor_replace_one underscore
    '';
  };
}
