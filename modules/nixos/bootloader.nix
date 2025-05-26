{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
