{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    inconsolata-nerdfont
    jetbrains-mono
    nerdfonts
    font-awesome
  ];
}
