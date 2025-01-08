{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    texlab
    tectonic # a modern TeX engine, no need to install texlive
    (texlive.withPackages (ps: [ ps.latexindent ])) # for format latex code
  ];
  programs.zed-editor = {
    extensions = [ "latex" ];
    userSettings.languages.LaTeX = {
      preferred_line_length = 1000;
      soft_wrap = "editor_width";
      hard_tabs = true;
    };
    userSettings.lsp.texlab = {
      binary.path = "${pkgs.texlab}/bin/texlab";
      settings.texlab = {
        latexindent.modifyLineBreaks = true;
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
