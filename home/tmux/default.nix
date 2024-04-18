{ pkgs, ... }:
{
  home.file.".config/tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.1.0";
      sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
    };
  };

  programs.tmux = {
    enable = true;
    customPaneNavigationAndResize = true;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = (builtins.readFile ./tmux.conf);
    keyMode = "vi";
    mouse = true;
  };
}
