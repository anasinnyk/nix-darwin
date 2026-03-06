{ pkgs, lib, ... }:
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
    ./opencode
    ./discord
  ];

  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;
  home.activation.linikApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    find ~/.nix-profile/Applications/ -name '*.app' -exec ln -sf {} ~/Applications/ \;
  '';

  home.packages = with pkgs; [
    gnupg
    _1password-cli
    direnv
    cachix
    devenv
  ];

  home.file.".config/direnv/direnv.toml".text = ''
    [global]
    log_filter="^$"
  '';

  home.sessionVariables = {
    EDITOR = "nvim";
    DIRENV_LOG_FORMAT = "";
  };

  programs = {
    home-manager.enable = true;
  };
}
