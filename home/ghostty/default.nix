{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Fira Code";
      theme = "Gruvbox Dark";
      macos-titlebar-style = "hidden";
      command = "/bin/zsh";
      mouse-hide-while-typing = true;
      macos-option-as-alt = true;
    };
  };
}
