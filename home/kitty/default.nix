{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Fira Code";
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "gruvbox-dark";
  };
}
