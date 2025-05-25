{ pkgs, inputs, ... }:

{
  services = {
    # dbus.enable = true;
    # udisks2.enable = true;
    libinput.enable = true;

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
      # lowLatency.enable = true;
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };
  };
}
