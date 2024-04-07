{ config, pkgs, lib, self, inputs, ...}:

{
  imports = [
    ./wayland/hyprland.nix
    ./wayland/waybar.nix
    ./wayland/wofi.nix
    ./wayland/hyprlock.nix
    ./wayland/hypridle.nix
    # ./wayland/hyprpaper.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "ugo";
  home.homeDirectory = "/home/ugo";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    bat
    brightnessctl
    cowsay
    element-desktop
    feh
    firefox
    freecad
    gimp
    gparted
    inkscape
    libreoffice
    logseq
    neovim
    openscad
    pdfarranger
    prusa-slicer
    python3
    pw-volume
    qbittorrent
    rpi-imager
    sshfs
    signal-desktop
    texlive.combined.scheme-full
    tldr
    trash-cli
    vlc
    zathura
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 18;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls="ls -lah";
    };
  };

  programs.direnv = {
    enable = true;
  };

  # programs.sftpman = {
  #   enable = true;
  #   mounts.anvil = {
  #     host = "anvil.ozalid.be";
  #     user = "ugo";
  #     authType = "publickey";
  #     sshKey = "/home/ugo/.ssh/id_rsa.pub";
  #     mountPoint = "/home/ugo/";
  #   };
  #   mounts.bookshelf = {
  #     host = "bookshelf.ozalid.be";
  #     user = "ugo";
  #     authType = "publickey";
  #     sshKey = "/home/ugo/.ssh/id_rsa.pub";
  #     mountPoint = "~";
  #   };
  # };

  # programs.texlive ={
  #   enable = true;
  #   package = "scheme-full";
  # };
}
