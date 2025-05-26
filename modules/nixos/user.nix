{
  pkgs,
  inputs,
  username,
  host,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs username host; };
    users.${username} = {
      # imports = [ ../home ];
    };
  };

  users.mutableUsers = false;
  users.users.${username} = {
    description = "${username}";
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

  nix.settings.allowed-users = [ "${username}" ];
}
