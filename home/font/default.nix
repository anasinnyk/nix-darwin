{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    nerd-fonts.inconsolata
    nerd-fonts.droid-sans-mono
    font-awesome
  ];
}
