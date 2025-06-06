{
  description = "Andy's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    impermanence.url = "github:nix-community/impermanence";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    hyprland.url = "github:hyprwm/Hyprland";

    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };
    hyprlock = {
  };

  outputs =
    { self
    , nixpkgs
    , impermanence
    , home-manager
    , zen-browser
    , ...
    }@inputs:

    let
      username = "rannj";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in

    {
      nixosConfigurations = {
        ZephyrusG15 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            host = "ZephyrusG15";
            inherit self inputs username;
          };
          modules = [
            impermanence.nixosModules.impermanence
            ./main/configuration.nix
          ];
        };
      };
    };
}
