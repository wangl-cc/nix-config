{
  pkgs,
  config,
  hmConfigPath,
  ...
}:
let
  symlink = file: config.lib.file.mkOutOfStoreSymlink "${hmConfigPath}/develop/zed/${file}";
in
{
  # many language servers and copilot require nodejs
  home.packages = with pkgs; [ nodejs ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "git-firefly"
      "typos"
      "wakatime"
    ];
    userSettings = {
      auto_update = false; # Zed is managed by nix, should not auto update

      buffer_font_family = "FiraCode Nerd Font";
      buffer_font_size = 13;
      ui_font_family = ".SystemUIFont";
      ui_font_size = 14;

      theme.mode = "system";
      theme.light = "Catppuccin Latte";
      theme.dark = "Catppuccin Macchiato";

      telemetry.metrics = false;

      scrollbar.show = "system";
      scrollbar.axes.horizontal = false;
      tab_bar.show_nav_history_buttons = false;
      tabs.close_position = "left";
      tabs.show_diagnostics = "errors";
      collaboration_panel.button = false;
      chat_panel.button = false;
      git.inline_blame.enabled = false;

      node.path = "${pkgs.nodejs}/bin/node";
      node.npm_path = "${pkgs.nodejs}/bin/npm";

      preferred_line_length = 80;
      wrap_guides = [ 80 ];
      tab_size = 2;

      vim_mode = true;
      vim.use_system_clipboard = "always";
      vim.use_multiline_find = true;
      vim.toggle_relative_line_numbers = true;

      pane_split_direction_horizontal = "down";
      pane_split_direction_vertical = "right";
      use_system_path_prompts = false;

      terminal = {
        shell.program = "fish";
        # Use zed itself as editor for CLI tools that require an editor.
        # `--add` flag makes zed open the file in current workspace.
        # `--wait` flag makes zed don't exit until the file is closed
        env.VISUAL = "zeditor --add";
        env.GIT_EDITOR = "zeditor --wait";
        # Use option as meta to make some Alt keybindings work on macOS
        option_as_meta = true;
        # Fish is not POSIX-compliant requiring a distinct activation script
        detect_venv.on.activate_script = "fish";
        toolbar.breadcrumbs = false;
      };

      assistant.default_model = {
        provider = "copilot_chat";
        model = "claude-3-5-sonnet";
      };
      assistant.default_width = 400;
      assistant.version = "2";

      inlay_hints.enabled = true;

      indent_guides.coloring = "indent_aware";

      task.show_status_indicator = false;
    };
    userSettings.languages.Markdown = {
      preferred_line_length = 1000;
      soft_wrap = "editor_width";
      remove_trailing_whitespace_on_save = false;
    };
    # Git Config use hard tabs to indent by default
    userSettings.languages."Git Config".hard_tabs = true;
  };

  xdg.configFile."zed/keymap.json".source = symlink "keymap.json";
  xdg.configFile."zed/tasks.json".source = symlink "tasks.json";
}
