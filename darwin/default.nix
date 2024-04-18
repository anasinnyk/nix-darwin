{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  services.nix-daemon.enable = true;

  nix.settings = {
    experimental-features = "nix-command flakes";
    trusted-users = [
      "root"
      "andriinasinnyk"
    ];
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  system.stateVersion = 4;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
  };

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "firefox"
      "wezterm"
      "signal"
      "slack"
      "telegram"
      "rectangle"
      "zoom"
      "loom"
      "orbstack"
      "keycastr"
    ];
  };
}
