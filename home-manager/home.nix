# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }:

{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "rannj";
    homeDirectory = "/home/rannj";
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default

    wl-clipboard
    btrfs-progs
    brightnessctl
    playerctl
    cpufrequtils

    wofi
    pavucontrol
    polkit_gnome
    wlogout
    cliphist
    xarchiver

    go-musicfox
  ];

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "rannj";
    userEmail = "rnj812382486@gmail.com";
    extraConfig = {
      url = {
        "git@github.com:".insteadOf = [ "gh:" "https://github.com/"];
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
