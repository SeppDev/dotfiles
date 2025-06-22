{ pkgs, ... }:

{
  home.packages = with pkgs; [ helix ];

  programs.helix = {
    enable = true;
    languages = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
    ];
    settings = {
      theme = "modus_vivendi";
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
