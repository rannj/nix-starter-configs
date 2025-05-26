{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../modules/nixos
    ../modules/impermanence.nix
  ];
}

