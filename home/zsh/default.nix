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
    plugins = [{
      name = "zsh-vi-mode";
      src = pkgs.zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }];
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
        "direnv"
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
        "sudo"
        "terraform"
        "yarn"
        "z"
      ];
    };
    sessionVariables = {
      ZSH_TMUX_AUTOSTART = false;
      ZSH_TMUX_AUTOCONNECT = false;
      ZSH_DOTENV_PROMPT = false;
    };
  };
}
