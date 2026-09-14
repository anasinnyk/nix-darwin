{ ... }:
{
  programs.herdr = {
    enable = true;
    settings = {
      terminal.default_shell = "zsh";
      experimental.kitty_graphics = true;
      keys = {
        prefix = "ctrl+space";
        help = [
          "prefix+?"
          "ctrl+alt+?"
        ];
        goto = [
          "prefix+g"
          "ctrl+alt+g"
        ];
        focus_pane_left = [
          "prefix+h"
          "ctrl+alt+h"
        ];
        focus_pane_down = [
          "prefix+j"
          "ctrl+alt+j"
        ];
        focus_pane_up = [
          "prefix+k"
          "ctrl+alt+k"
        ];
        focus_pane_right = [
          "prefix+l"
          "ctrl+alt+l"
        ];
        previous_workspace = [
          "prefix+shift+p"
          "ctrl+alt+shift+["
        ];
        next_workspace = [
          "prefix+shift+n"
          "ctrl+alt+shift+]"
        ];
        new_workspace = [
          "prefix+shift+c"
          "ctrl+alt+shift+c"
        ];
        previous_tab = [
          "prefix+p"
          "ctrl+alt+["
        ];
        next_tab = [
          "prefix+n"
          "ctrl+alt+]"
        ];
        new_tab = [
          "prefix+c"
          "ctrl+alt+c"
        ];
        close_tab = [
          "prefix+shift+x"
          "ctrl+alt+shift+x"
        ];
        rename_tab = [
          "prefix+t"
          "ctrl+alt+t"
        ];
        cycle_pane_next = [
          "prefix+tab"
          "ctrl+alt+tab"
        ];
        cycle_pane_previous = [
          "prefix+shift+tab"
          "ctrl+alt+shift+tab"
        ];
        toggle_sidebar = [
          "prefix+b"
          "ctrl+alt+b"
        ];
        resize_mode = [
          "prefix+r"
          "ctrl+alt+r"
        ];
        split_vertical = [
          "prefix+|"
          "ctrl+alt+|"
        ];
        split_horizontal = [
          "prefix+minus"
          "ctrl+alt+minus"
        ];
        close_pane = [
          "prefix+x"
          "ctrl+alt+x"
        ];
        zoom = [
          "prefix+z"
          "ctrl+alt+z"
        ];
      };
      theme.name = "gruvbox";
    };
  };
}
