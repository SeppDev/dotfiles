{ pkgs, ... }:

{
  home.packages = with pkgs; [ helix ];

  programs.helix = {
    enable = true;
    languages = {
      nix = {
        auto-format = true;
        formatter.command = "nixfmt";
      };
      language-server.qmlls = {
        args = ["-E"];
        command = "qmlls";
      };
      # qml = {
        # language-servers = [ "qmlls" ];
        # file-types = [ "qml" ];
      # };
    };
    themes = {
      transparent = {
        "inherits" = "carbonfox";
        "ui.background" = { };
      };
    };
    settings = {
      theme = "transparent";
      editor = {
        line-number = "relative";
        mouse = true;
        auto-format = true;
        lsp = {
          display-inlay-hints = true;
        };
        file-picker = {
          hidden = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys = {
        normal = {
          "C-s" = ":w";
          "C-a" = "select_all";
          "C-S-c" = ":clipboard-yank";
          "C-S-i" = ":format";
        };
        insert = {
          "C-s" = ":w";
        };
        select = {
          "C-S-c" = ":clipboard-yank";
        };
      };
    };
  };
}
