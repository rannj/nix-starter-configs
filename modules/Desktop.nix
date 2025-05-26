{ pkgs, inputs, ... }:

{
  programs.xwayland.enable = true;

  programs.hyprland = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };
  };
}
