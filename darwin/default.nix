{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  ];

  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";
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
