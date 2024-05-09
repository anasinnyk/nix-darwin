{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    trusted-users = [
      "root"
      "andriinasinnyk"
    ];
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  system.stateVersion = 4;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
  };

  services = {
    nix-daemon.enable = true;
    yabai = {
      enable = true;
      config = {
        "mouse_follows_focus" = "on";
        "focus_follows_mouse" = "on";
        "window_origin_display" = "default";
        "window_placement" = "second_child";
        "window_topmost" = "off";
        "window_shadow" = "on";
        "window_opacity" = "on";
        "window_opacity_duration" = "0.0";
        "active_window_opacity" = "1.0";
        "normal_window_opacity" = "0.90";
        "window_border" = "off";
        "window_border_width" = "6";
        "active_window_border_color" = "0xff775759";
        "normal_window_border_color" = "0xff555555";
        "insert_feedback_color" = "0xffd75f5f";
        "split_ratio" = "0.50";
        "auto_balance" = "off";
        "mouse_modifier" = "fn";
        "mouse_action1" = "move";
        "mouse_action2" = "resize";
        "mouse_drop_action" = "swap";
        "layout" = "bsp";
        "top_padding" = "10";
        "bottom_padding" = "10";
        "left_padding" = "10";
        "right_padding" = "10";
        "window_gap" = "10";
      };
      extraConfig = ''
        sudo yabai --load-sa
        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

        # apps to not manage (ignore)
        yabai -m rule --add app="^System Settings$" manage=off
        yabai -m rule --add app="^Archive Utility$" manage=off
        yabai -m rule --add app="^1Password$" manage=off

        echo "yabai configuration loaded.."
      '';
    };
    skhd = {
      enable = true;
      skhdConfig = ''
        # focus window
        alt - h : yabai -m window --focus west
        alt - j : yabai -m window --focus south
        alt - k : yabai -m window --focus north
        alt - l : yabai -m window --focus east

        # swap managed window
        shift + alt - h : yabai -m window --swap west
        shift + alt - j : yabai -m window --swap south
        shift + alt - k : yabai -m window --swap north
        shift + alt - l : yabai -m window --swap east

        # move managed window
        shift + alt + ctrl - h : yabai -m window --warp west
        shift + alt + ctrl - j : yabai -m window --warp south
        shift + alt + ctrl - k : yabai -m window --warp north
        shift + alt + ctrl - l : yabai -m window --warp east

        # rotate tree
        alt + shift - r : yabai -m space --rotate 90

        # toggle window fullscreen zoom
        alt + shift - f : yabai -m window --toggle zoom-fullscreen

        # float / unfloat window and center on screen
        alt + shift - t : yabai -m window --toggle float;\
                  yabai -m window --grid 4:4:1:1:2:2

        # toggle window split type
        alt + shift - e : yabai -m window --toggle split

        # move window and focus desktop
        shift + alt - 1 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 1; yabai -m window --focus $w
        shift + alt - 2 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 2; yabai -m window --focus $w
        shift + alt - 3 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 3; yabai -m window --focus $w
        shift + alt - 4 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 4; yabai -m window --focus $w
        shift + alt - 5 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 5; yabai -m window --focus $w
        shift + alt - 6 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 6; yabai -m window --focus $w
        shift + alt - 7 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 7; yabai -m window --focus $w
        shift + alt - 8 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 8; yabai -m window --focus $w
        shift + alt - 9 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 9; yabai -m window --focus $w
        shift + alt - 0 : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --space 10; yabai -m window --focus $w

        alt - 1 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 1) | ."first-window"'); yabai -m window --focus $w
        alt - 2 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 2) | ."first-window"'); yabai -m window --focus $w
        alt - 3 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 3) | ."first-window"'); yabai -m window --focus $w
        alt - 4 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 4) | ."first-window"'); yabai -m window --focus $w
        alt - 5 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 5) | ."first-window"'); yabai -m window --focus $w
        alt - 6 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 6) | ."first-window"'); yabai -m window --focus $w
        alt - 7 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 7) | ."first-window"'); yabai -m window --focus $w
        alt - 8 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 8) | ."first-window"'); yabai -m window --focus $w
        alt - 9 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 9) | ."first-window"'); yabai -m window --focus $w
        alt - 0 : w=$(yabai -m query --spaces | jq '.[] | select(.index == 10) | ."first-window"'); yabai -m window --focus $w

        # fast prev focus
        alt - tab : yabai -m window --focus recent

        # send window to monitor and follow focus
        shift + alt - n : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --display next; yabai -m window --focus $w
        shift + alt - p : w=$(yabai -m query --windows --window | jq '.id'); yabai -m window --display prev; yabai -m window --focus $w
        shift + alt - r : \
          w=$(yabai -m query --windows --window | jq '.id'); \
          cs=$(yabai -m query --spaces --space | jq '.index'); \
          ns=$(yabai -m query --spaces | jq '[.[] | select(."is-visible" == true and ."has-focus" == false) | .index][0]'); \
          csws=$(yabai -m query --spaces --space | jq '.windows | .[]'); \
          nsws=$(yabai -m query --spaces --space $ns | jq '.windows | .[]'); \
          echo $csws | xargs -n1 -I{} yabai -m window {} --space $ns; \
          echo $nsws | xargs -n1 -I{} yabai -m window {} --space $cs; \
          yabai -m window --focus $w;
      '';
    };
  };



  homebrew = {
    enable = true;

    casks = [
      "1password"
      "tailscale"
      "firefox"
      "wezterm"
      "alacritty"
      "signal"
      "slack"
      "telegram"
      "rectangle"
      "zoom"
      "loom"
      "orbstack"
      "keycastr"
      "via"
      "setapp"
    ];
  };
}
