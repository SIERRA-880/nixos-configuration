{ config, pkgs, lib, self, inputs, ...}:

{
  imports = [
    ./wayland/hyprland.nix
    ./wayland/waybar.nix
    ./wayland/wofi.nix
    ./wayland/hyprlock.nix
    ./wayland/hypridle.nix
    ./wayland/hyprpaper.nix

    # ./programs/kitty.nix

    inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;

  # base00: "#2E3440"
  # base01: "#3B4252"
  # base02: "#434C5E"
  # base03: "#4C566A"

  # base04: "#D8DEE9"
  # base05: "#E5E9F0"
  # base06: "#ECEFF4"

  # base07: "#8FBCBB"
  # base08: "#BF616A"
  # base09: "#D08770"
  # base0A: "#EBCB8B"
  # base0B: "#A3BE8C"
  # base0C: "#88C0D0"
  # base0D: "#81A1C1"
  # base0E: "#B48EAD"
  # base0F: "#5E81AC"

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
    # logseq
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
