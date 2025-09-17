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
      "df" = "duf";
      "less" = "most";
      "ps" = "procs";
      "wttr" = "curl wttr.in/Kyiv";
    };
    plugins = [
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
    "oh-my-zsh" = {
      enable = true;
      plugins = [
        "git"
        "1password"
        "tmux"
        "cabal"
        "copybuffer"
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
