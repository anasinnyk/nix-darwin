{ pkgs, lib, ... }:
{
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.zsh = {
    enable = true;
    localVariables = {
      DISABLE_AUTO_TITLE = "true";
    };

    autosuggestion.enable = true;
    initContent = lib.mkOrder 500 ''
      export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
      eval "$(devenv hook zsh)"

      strip_devenv_prefix() {
        export PROMPT=''${PROMPT//"(devenv) "/󰵮 }
        export PS1=''${PS1//"(devenv) "/󰵮 }

        if [[ -n "$TMUX" ]]; then
          if [[ -n "$DEVENV_STATE" ]]; then
            tmux rename-window "󰵮"
          fi
        fi
      }

      autoload -Uz add-zsh-hook
      add-zsh-hook precmd strip_devenv_prefix
    '';
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
        "cabal"
        "copybuffer"
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
      DISABLE_AUTO_TITLE = true;
    };
  };
}
