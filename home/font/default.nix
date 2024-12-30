{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.inconsolata
    nerd-fonts.droid-sans-mono
    font-awesome
  ];
}
