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
        swap_pane_left = [
          "ctrl+alt+shift+h"
        ];
        swap_pane_down = [
          "ctrl+alt+shift+j"
        ];
        swap_pane_up = [
          "ctrl+alt+shift+k"
        ];
        swap_pane_right = [
          "ctrl+alt+shift+l"
        ];
        previous_workspace = [
          "prefix+["
          "ctrl+alt+["
        ];
        next_workspace = [
          "prefix+]"
          "ctrl+alt+]"
        ];
        new_workspace = [
          "prefix+shift+c"
          "ctrl+alt+shift+c"
        ];
        close_workspace = [
          "prefix+shift+x"
          "ctrl+alt+shift+x"
        ];
        rename_workspace = [
          "prefix+shift+t"
          "ctrl+alt+shift+t"
        ];
        previous_tab = [
          "prefix+,"
          "ctrl+alt+,"
        ];
        next_tab = [
          "prefix+."
          "ctrl+alt+."
        ];
        move_tab_previous = [
          "prefix+shift+,"
          "ctrl+alt+shift+,"
        ];
        move_tab_next = [
          "prefix+shift+."
          "ctrl+alt+shift+."
        ];
        new_tab = [
          "prefix+c"
          "ctrl+alt+c"
        ];
        close_tab = [
          "prefix+x"
          "ctrl+alt+x"
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
          "prefix+d"
          "ctrl+alt+d"
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
