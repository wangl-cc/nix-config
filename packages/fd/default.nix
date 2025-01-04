{
  ...
}:
{
  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [
      ".git"
    ];
    extraOptions = [
      "--follow"
    ];
  };
  # Fzf uses fd as the default command instead of find
  # which is much faster and respect .gitignore or similar files
  programs.fzf =
    let
      fdFzfExtraOptions = "--color=always";
    in
    {
      defaultCommand = "fd ${fdFzfExtraOptions}";
      fileWidgetCommand = "fd --type f ${fdFzfExtraOptions}";
      fileWidgetOptions = [ "--ansi" ];
      changeDirWidgetCommand = "fd --type d ${fdFzfExtraOptions}";
      changeDirWidgetOptions = [ "--ansi" ];
    };
}
