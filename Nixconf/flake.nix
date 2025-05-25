{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    impermanence.url = "github:nix-community/impermanence";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    yazi.url = "github:sxyazi/yazi";
  };

  outputs =
    { self
    , nixpkgs
    , impermanence
    , home-manager
    , zen-browser
    , yazi
    , ...
    } @ inputs:

    let
      inherit (self) outputs;
    in

    {
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        ZephyrusG15 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            impermanence.nixosModules.impermanence
            ./configuration.nix
          ];
        };
      };

      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "rannj@ZephyrusG15" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; system = "x86_64-linux";};
          modules = [
            ./home-manager/home.nix
            ({ pkgs, ... }: {
              home.packages = [ yazi.packages.${pkgs.system}.default ];
            })
          ];
        };
      };
    };
}
