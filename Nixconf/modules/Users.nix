{ pkgs, ... }:

{
  users.mutableUsers = false;
  users.users = {
    rannj = {
      hashedPassword = "$6$yLG3E1MQAgevt2wh$LxiEJi23fDfR0lCleSwC5FoDGKVtRhl4h.stOiDur6MhwWob.qrZDMe.BNLwOFB7mhmVuabb/wJQ.5jgyFota.";
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
