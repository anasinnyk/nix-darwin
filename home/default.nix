{ pkgs, lib, ... }:
{
  imports = [
    ./wezterm
    ./ghostty
    ./kitty
    ./alacritty
    ./zsh
    ./tmux
    ./starship
    ./utils
    ./git
    ./font
    ./nvim
    ./languages
    ./firefox
    ./google-chrome
    ./opencode
    ./discord
    ./pi
    ./herdr
  ];

  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  home.activation.linikApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    find ~/.nix-profile/Applications/ -name '*.app' -exec ln -sf {} ~/Applications/ \;
  '';

  home.packages = with pkgs; [
    gnupg
    _1password-cli
    _1password-gui
    slack
    zoom-us
    claude-code
    pritunl-client
    keycastr
    cachix
    devenv
    herdr
    pi-coding-agent
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    home-manager.enable = true;
  };
}
