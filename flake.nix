{
  description = "Andrii Nasinnyk Darwin flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nix-darwin.url = "github:LnL7/nix-darwin";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:wegank/nix-darwin/mddoc-remove";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
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
            mutableTaps = false;
            autoMigrate = true;
          };
        }
	{
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
