{ pkgs, ... }:
{
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      "ls" = "eza --icons -l -T -L=1";
      "cat" = "bat";
      "top" = "btop";
      "grep" = "rg";
    };
    "oh-my-zsh" = {
      enable = true;
      plugins = [
        "git"
        "1password"
        "tmux"
        "cabal"
        "copybuffer"
        "docker-compose"
        "docker"
        "dotenv"
        "encode64"
        "fluxcd"
        "fzf"
        "gcloud"
        "gh"
        "golang"
        "hasura"
        "helm"
        "httpie"
        "kubectl"
        "node"
        "npm"
        "pip"
        "python"
        "redis-cli"
        "qrcode"
        "rust"
        "starship"
        "sudo"
        "terraform"
        "yarn"
        "z"
      ];
    };
    sessionVariables = {
      ZSH_TMUX_AUTOSTART = false;
      ZSH_TMUX_AUTOCONNECT = false;
    };
  };
}
