{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      import = ["${pkgs.alacritty-theme}/gruvbox_material_medium_light.toml"];
      window = {
        padding = {
          x = 18;
          y = 16;
        };
        decorations = "buttonless";
        opacity = 0.9;
        option_as_alt = "Both";
      };
      scrolling = {
        history = 20000;
        multiplier = 3;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 14.0;
      };
      bell.duration = 0;
      shell = {
        program = "/bin/zsh";
        args = ["-l" "-c" "tmux attach 2> /dev/null || tmux"];
      };
    };
  };
}
