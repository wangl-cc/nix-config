{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    texlab
    tectonic
  ];
  programs.zed-editor = {
    extensions = [ "latex" ];
    userSettings.languages.LaTeX = {
      preferred_line_length = 1000;
      soft_wrap = "editor_width";
    };
    userSettings.lsp.texlab = {
      binary.path = "${pkgs.texlab}/bin/texlab";
      settings.texlab = {
        latexindent.modifyLineBreaks = true;
        # forwardSearch.executable = "/Applications/Skim.app/Contents/SharedSupport/displayline";
        # forwardSearch.args = [
        #   "-r"
        #   "%l"
        #   "%p"
        #   "%f"
        # ];
        build.onSave = true;
        build.executable = "${pkgs.tectonic}/bin/tectonic";
        build.args = [
          "-X"
          "compile"
          "%f"
          "--untrusted"
          "--synctex"
          "--keep-logs"
          "--keep-intermediates"
        ];
      };
    };
  };
}
