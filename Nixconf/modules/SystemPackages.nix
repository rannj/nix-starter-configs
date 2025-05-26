{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    ffmpeg
    p7zip-rar
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    resvg
    gnutar
    unzip
    gzip
    bzip3
    eza

    nixpkgs-fmt

    curl
    wget
    fastfetch
    kitty
    fish
    starship
    btop-cuda
    amdgpu_top
    nvtopPackages.full
  ];

  programs.neovim.enable = true;

  programs.thunar = {
    enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];
  };

  environment = {
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  fonts.enableDefaultPackages = true;

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
    antialias = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans CJK SC" ];
      serif = [ "Noto Serif CJK SC" ];
      monospace = [ "FiraMono Nerd Font Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
