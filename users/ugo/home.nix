{ config, pkgs, lib, self, inputs, ...}:

{
  imports = [
    ./wayland/hyprland.nix
    ./wayland/waybar.nix
    ./wayland/wofi.nix
    ./wayland/hyprlock.nix
    ./wayland/hypridle.nix
    ./wayland/hyprpaper/hyprpaper.nix
    ./wayland/ags/ags.nix

    ./programs/kitty.nix

    inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;
  # base00: "#32302f"
  # base01: "#3c3836"
  # base02: "#504945"
  # base03: "#665c54"
  # base04: "#bdae93"
  # base05: "#d5c4a1"
  # base06: "#ebdbb2"
  # base07: "#fbf1c7"
  # base08: "#fb4934"
  # base09: "#fe8019"
  # base0A: "#fabd2f"
  # base0B: "#b8bb26"
  # base0C: "#8ec07c"
  # base0D: "#83a598"
  # base0E: "#d3869b"
  # base0F: "#d65d0e"

  home.username = "ugo";
  home.homeDirectory = "/home/ugo";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    bat
    brave
    brightnessctl
    cowsay
    element-desktop
    feh
    firefox
    flameshot
    freecad
    gcc
    gimp
    gparted
    inkscape
    libreoffice
    # logseq
    neovim
    nixos-generators
    # openscad
    # openstackclient
    pavucontrol
    pdfarranger
    prusa-slicer
    jetbrains.pycharm-professional
    ollama
    podman-compose
    python3
    pw-volume
    qbittorrent
    rpi-imager
    sshfs
    signal-desktop
    terraform
    tesseract
    texlive.combined.scheme-full
    tldr
    trash-cli
    vlc
    zathura
    zed-editor
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
  #     sshKey = "/home/ugo/.ssh/id_rsa";
  #     mountPoint = "/";
  #   };
  #   mounts.chest = {
  #     host = "192.168.1.31";
  #     user = "ugo";
  #     authType = "publickey";
  #     sshKey = "/home/ugo/.ssh/id_rsa";
  #     mountPoint = "/";
  #   };
  # };

  programs.git = {
    enable = true;
    userEmail = "ugo.pr@protonmail.com";
    userName = "Ugo Proietti";
  };
}
