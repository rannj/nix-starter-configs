{ inputs, outputs, ... }: 

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      rannj = import ./home.nix;
    };
  };
}