{ ... }:
{
  home.file.".config/ghostty/config".text = builtins.readFile ./config;

  programs.ghostty = {
    enable = false; # switch when darwin will be fix
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "JetBrains Mono";
      theme = "GruvboxDark";
      macos-titlebar-style = "hidden";
      command = "/bin/zsh -l -c tmux attach 2> /dev/null || tmux";
      mouse-hide-while-typing = true;
      macos-option-as-alt = true;
    };
  };
}
