{ pkgs, inputs, ... }:
{
  imports = [
    ./wezterm
    ./alacritty
    ./zsh
    ./tmux
    ./starship
    ./utils
    ./git
    ./font
    ./nvim
    ./languages
  ];

  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    gnupg
    _1password-cli
    direnv
    cachix
    inputs.devenv.packages."${pkgs.system}".devenv
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";
  };

  programs = {
    home-manager.enable = true;
  };
}
