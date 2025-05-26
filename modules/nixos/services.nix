{ pkgs, inputs, ... }:

{
  services = {
    # dbus.enable = true;
    pulseaudio.enable = false;
    fstrim.enable = true;
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

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
