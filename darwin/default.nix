{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  nix = {
    enable = true;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "andriinasinnyk"
      ];
      extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
      extra-substituters = "https://devenv.cachix.org";
    };
  };

  programs.zsh.enable = true;
  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
  '';
  system.stateVersion = 4;
  system.primaryUser = "andriinasinnyk";

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  services = {
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
      skhdConfig = builtins.readFile ./skhdrc;
    };
  };



  homebrew = {
    enable = true;

    casks = [
      "1password"
      "signal"
      "slack"
      "zoom"
      "loom"
      "orbstack"
      "keycastr"
      "via"
      "claude"
    ];
  };
}
