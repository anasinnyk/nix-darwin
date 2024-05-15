{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua-language-server
  ];

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
