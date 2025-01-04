{ lib, ... }:
{
  programs.git.delta = {
    enable = true;
    options = {
      navigate = true;
      side-by-side = true;
      latte = {
        blame-palette = "#eff1f5 #e6e9ef #dce0e8 #ccd0da #bcc0cc";
        commit-decoration-style = "box ul";
        dark = false;
        file-decoration-style = "#4c4f69";
        file-style = "#4c4f69";
        hunk-header-decoration-style = "box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold #6c6f85";
        hunk-header-style = "file line-number syntax";
        line-numbers = true;
        line-numbers-left-style = "#9ca0b0";
        line-numbers-minus-style = "bold #d20f39";
        line-numbers-plus-style = "bold #40a02b";
        line-numbers-right-style = "#9ca0b0";
        line-numbers-zero-style = "#9ca0b0";
        minus-emph-style = "bold syntax #e8bac8"; # 25% red 75% base
        minus-style = "syntax #eddbe2"; # 10% red 90% base
        plus-emph-style = "bold syntax #c3ddc3"; # 25% green 75% base
        plus-style = "syntax #dee8e0"; # 10% green 90% base
        map-styles = lib.concatStrings [
          ''bold purple => syntax "#d6c4f4",''
          ''bold blue => syntax "#bbcff5",''
          ''bold cyan => syntax "#b4dff2",''
          ''bold yellow => syntax "#ebd9bf"''
        ];
        syntax-theme = "latte"; # Should match the name of the bat theme
      };
      frappe = {
        blame-palette = "#303446 #292c3c #232634 #414559 #51576d";
        commit-decoration-style = "box ul";
        dark = true;
        file-decoration-style = "#c6d0f5";
        file-style = "#c6d0f5";
        hunk-header-decoration-style = "box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold #a5adce";
        hunk-header-style = "file line-number syntax";
        line-numbers = true;
        line-numbers-left-style = "#737994";
        line-numbers-minus-style = "bold #e78284";
        line-numbers-plus-style = "bold #a6d189";
        line-numbers-right-style = "#737994";
        line-numbers-zero-style = "#737994";
        minus-emph-style = "bold syntax #5e4855"; # 25% red 75% base
        minus-style = "syntax #433c4c"; # 10% red 90% base
        plus-emph-style = "bold syntax #4e5c57"; # 25% green 75% base
        plus-style = "syntax #3c444e"; # 10% green 90% base
        map-styles = lib.concatStrings [
          ''bold purple => syntax "#574f6f",''
          ''bold blue => syntax "#475271",''
          ''bold cyan => syntax "#4b5c6b",''
          ''bold yellow => syntax "#5d5a59"''
        ];
        syntax-theme = "frappe"; # Should match the name of the bat theme
      };
      macchiato = {
        blame-palette = "#24273a #1e2030 #181926 #363a4f #494d64";
        commit-decoration-style = "box ul";
        dark = true;
        file-decoration-style = "#cad3f5";
        file-style = "#cad3f5";
        hunk-header-decoration-style = "box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold #a5adcb";
        hunk-header-style = "file line-number syntax";
        line-numbers = true;
        line-numbers-left-style = "#6e738d";
        line-numbers-minus-style = "bold #ed8796";
        line-numbers-plus-style = "bold #a6da95";
        line-numbers-right-style = "#6e738d";
        line-numbers-zero-style = "#6e738d";
        minus-emph-style = "bold syntax #564052"; # 25% red 75% base
        minus-style = "syntax #383143"; # 10% red 90% base
        plus-emph-style = "bold syntax #455552"; # 25% green 75% base
        plus-style = "syntax #313943"; # 10% green 90% base
        map-styles = lib.concatStrings [
          ''bold purple => syntax "#4d4569",''
          ''bold blue => syntax "#3e4868",''
          ''bold cyan => syntax "#3f5365",''
          ''bold yellow => syntax "#585253"''
        ];
        syntax-theme = "macchiato"; # Should match the name of the bat theme
      };
      mocha = {
        blame-palette = "#1e1e2e #181825 #11111b #313244 #45475a";
        commit-decoration-style = "box ul";
        dark = true;
        file-decoration-style = "#cdd6f4";
        file-style = "#cdd6f4";
        hunk-header-decoration-style = "box ul";
        hunk-header-file-style = "bold";
        hunk-header-line-number-style = "bold #a6adc8";
        hunk-header-style = "file line-number syntax";
        line-numbers = true;
        line-numbers-left-style = "#6c7086";
        line-numbers-minus-style = "bold #f38ba8";
        line-numbers-plus-style = "bold #a6e3a1";
        line-numbers-right-style = "#6c7086";
        line-numbers-zero-style = "#6c7086";
        minus-emph-style = "bold syntax #53394c"; # 25% red 75% base
        minus-style = "syntax #35293b"; # 10% red 90% base
        plus-emph-style = "bold syntax #40504b"; # 25% green 75% base
        plus-style = "syntax #2c333a"; # 10% green 90% base
        map-styles = lib.concatStrings [
          ''bold purple => syntax "#494060",''
          ''bold blue => syntax "#394361",''
          ''bold cyan => syntax "#384d5e",''
          ''bold yellow => syntax "#544f4e"''
        ];
        syntax-theme = "mocha"; # Should match the name of the bat theme
      };
    };
  };
}
