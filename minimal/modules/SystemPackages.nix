{ pkgs, inputs, ...}: 

{
  environment.systemPackages = with pkgs; [

  ];

  # FONTS
  fonts.packages = with pkgs; [
    sarasa-gothic
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.fantasque-sans-mono
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = false;
    defaultFonts = {
      sansSerif = [ "" ];
      serif = [ "" ];
      monospace = [ "" ];
      emoji = [ "" ];
    };
  };

  programs.xwayland.enable = true;

#   xdg.portal = {
#     enable = true;
#     wlr.enable = false;
#     extraPortals = [
#       pkgs.xdg-desktop-portal-gtk
#     ];
#     configPackages = [
#       pkgs.xdg-desktop-portal-gtk
#       pkgs.xdg-desktop-portal
#     ];
#   };
}
