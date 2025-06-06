{ input, pkgs, config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # package = hyprland-pkgs.mesa; ## Altered
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
    open = false;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    dynamicBoost.enable = true;

    nvidiaPersistenced = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:6@0:0:0";
    nvidiaBusId = "PCI:1@0:0:0";
    sync.enable = true;
    # offload = {
    #   enable = true;
    #   enableOffloadCmd = true;
    # };
  };
}
