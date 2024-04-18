{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
    disfetch
    lolcat
    cowsay
    onefetch
    jq
    yq-go
    ripgrep
    eza
    bat
    whois
    unzip
    neofetch
    httpie
  ];
}
