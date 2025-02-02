{
  description = "Andrii Nasinnyk Darwin flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/d2faa1bbca1b1e4962ce7373c5b0879e5b12cef2";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    devenv.url = "github:cachix/devenv/latest";
    home-manager.url = "github:nix-community/home-manager/master";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, home-manager, nixpkgs, ... }:
  let
    user = "andriinasinnyk";
    system = "aarch64-darwin";
    localSystem = "aarch64-darwin";
  in
  {
    darwinConfigurations."eel-K90P6X6DYT-MBP" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [ 
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            inherit user;
            enable = true;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
            mutableTaps = true;
            # autoMigrate = true;
          };
        }
        {
          nixpkgs.overlays = [ inputs.firefox-darwin.overlay ];
	  home-manager.useGlobalPkgs = true;
	  home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users."${user}" = import ./home;
          users.users."${user}".home = "/Users/${user}";
	}
        ./darwin
      ];
    };

    darwinPackages = self.darwinConfigurations."eel-K90P6X6DYT-MBP".pkgs;
  };
}
