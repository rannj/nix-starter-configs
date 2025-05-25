{ pkgs, ... }:

{
  users.mutableUsers = false;
  users.users = {
    rannj = {
      hashedPasswordFile = "/home/rannj/.config/hashedpassword";
      isNormalUser = true;
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
