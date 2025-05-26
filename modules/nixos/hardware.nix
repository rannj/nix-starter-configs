{ lib, pkgs, config, ... }:

let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in

{
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    package = hyprland-pkgs.mesa; ## Altered
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
      vdpauinfo
      libva
      libva-utils
    ];
  };

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    dynamicBoost.enable = true;

    nvidiaPersistenced = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:6@0:0:0";
    nvidiaBusId = "PCI:1@0:0:0";
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}
