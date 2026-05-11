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

      rename_tmux_on_exec() {
        if [[ -n "$TMUX" ]]; then
          local cmd="''${1%% *}"
          local window_title

          case "$cmd" in
            nvim|vim|vi) window_title="" ;;
            git)         window_title="󰊢" ;;
            docker)      window_title="󰡨" ;;
            kubectl|k|k9s) window_title="󱃾" ;;
            ssh)         window_title="󰣀" ;;
            *)           window_title="$cmd" ;;
          esac

          if [[ -n "$DEVENV_STATE" ]]; then
            tmux rename-window "󰵮 $window_title"
          else
            tmux rename-window "$window_title"
          fi
        fi
      }

      reload_devenv_completions() {
        if [[ "$DEVENV_STATE" != "$_CURRENT_DEVENV_STATE" ]]; then
          export _CURRENT_DEVENV_STATE="$DEVENV_STATE"

          if [[ -n "$DEVENV_PROFILE" ]]; then
            typeset -U fpath
            fpath=("$DEVENV_PROFILE/share/zsh/site-functions" $fpath)
          fi

          autoload -Uz compinit
          compinit -D 2>/dev/null
        fi
      }

      autoload -Uz add-zsh-hook
      add-zsh-hook precmd strip_devenv_prefix
      add-zsh-hook preexec rename_tmux_on_exec
      add-zsh-hook precmd reload_devenv_completions
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
