{ pkgs, inputs, ... }:

{
  services = {
    # dbus.enable = true;
    pulseaudio.enable = false;
    udisks2.enable = true;
    libinput.enable = true;
    gvfs.enable = true; 
    supergfxd.enable = true;
    asusd.enable = true;

    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      xkb = {
        layout = "us";
        options = "";
      };
    };  

    displayManager = {
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        wayland.enable = true;
      };
    }; 
    
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      # wireplumber.enable = true;
      # lowLatency.enable = true;
    };
  
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    supergfxd.enable = true;
    asusd.enable = true;
  };
}
