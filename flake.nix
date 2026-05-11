{
  description = "Andrii Nasinnyk Darwin flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin/main";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      home-manager,
      nixpkgs,
      devenv,
      ...
    }:
    let
      user = "andriinasinnyk";
    in
    {
      darwinConfigurations."eel-K90P6X6DYT-MBP" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = [
              inputs.firefox-darwin.overlay
              (final: prev: {
                devenv = inputs.devenv.packages.${prev.stdenv.hostPlatform.system}.default;
              })
            ];
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users."${user}" = import ./home;
            home-manager.backupFileExtension = "backup";
            users.users."${user}".home = "/Users/${user}";
            ids.gids.nixbld = 350;
          }
          ./darwin
        ];
      };

      darwinPackages = self.darwinConfigurations."eel-K90P6X6DYT-MBP".pkgs;
    };
}
