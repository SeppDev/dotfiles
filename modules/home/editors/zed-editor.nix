{ pkgs, ... }:

{
  home.packages = with pkgs; [ zed-editor ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "lua"
      "catppuccin-espresso"
    ];
    userSettings = {
      languages = {
        Nix = {
          language_servers = [
            "nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
        QML = {
          format_on_save = "off";
          formatter = {
            external = {
              command = "qmlformat";
              arguments = ["{buffer_path}"];
            };
          };
        };
      };
      vim_mode = false;
      buffer_font_size = 16;
      ui_font_size = 18;
      buffer_line_height = "standard";
      project_panel = {
        dock = "right";
      };
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      tabs = {
        show_diagnostics = "all";
      };
      icon_theme = "Material Icon Theme";
      theme = {
        mode = "dark";
        dark = "Fleet Dark";
        light = "Fleet Light";
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
      };
      scrollbar = {
        show = "auto";
        cursors = true;
        git_diff = true;
        search_results = true;
        selected_symbol = true;
        diagnostics = "all";
      };
      diagnostics = {
        include_warnings = true;
        # inline = {
        #   enabled = true;
        #   update_debounce_ms = 150;
        #   padding = 4;
        #   min_column = 0;
        #   max_severity = null;
        # };
      };
    };

  };
}
