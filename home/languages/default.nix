{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    nil
  ];
}
