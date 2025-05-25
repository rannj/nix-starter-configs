{ lib, pkgs, config, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ 
    "amdgpu"
    "nvidia"
  ];

  hardware.graphics = {
  	enable = true;
  	enable32Bit = true;
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

    dynamicBoost.enable = false;
    nvidiaPersistenced = false;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

#   hardware.nvidia = {
#     prime = {
#       offload = {
#         enable = true;
#         enableOffloadCmd = true;
#       };
#       amdgpuBusId = "";
#       nvidiaBusId = "";
#     };
#   };
}
