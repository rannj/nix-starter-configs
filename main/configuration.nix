{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos
    ../modules/impermanence.nix
  ];
}

