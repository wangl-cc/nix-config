{
  ...
}:
{
  programs.atuin = {
    enable = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      workspaces = true;
      keymap_mode = "auto";
      keymap_cursor = {
        vim_insert = "blink-bar";
        vim_normal = "steady-block";
      };
      sync.records = true;
    };
  };
}
