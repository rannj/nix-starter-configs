{ pkgs, host, ... }:
{
  networking = {
    hostName = "ZephyrusG15";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
