{ ... }:
{
  home.file.".config/ghostty/config" = {
    text = builtins.readFile ./config;
  };
}
