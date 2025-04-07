{ pkgs, ... }:
{
  imports = [
    ./wezterm
    ./ghostty
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
  ];

  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    gnupg
    _1password-cli
    direnv
    cachix
    youtube-music
    devenv
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";
  };

  programs = {
    home-manager.enable = true;
  };
}
