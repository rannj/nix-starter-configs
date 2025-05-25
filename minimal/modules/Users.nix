{ pkgs, username, ... }:

{
  users.users = {
    rannj = {
      mutableUsers = false;
      initialPassword = "rnjatzq1314";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGgUZdxZSOlh/H+hhKibGmX57QtgsyER1dBmlc0ARHM0 rannj@ZephyrusG15"
      ];
      extraGroups = [
        "networkmanager"
        "wheel"
        "video" 
        "input" 
        "audio"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    
  ]; 
}
