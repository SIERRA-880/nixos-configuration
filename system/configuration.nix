{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./programs/syncthing.nix
      ./programs/tlp.nix
    ];

  # Nix flakes
  nix.package = pkgs.nixVersions.latest;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # # Configure keymap in X11
  # services.xserver = {
  #   layout = "us";
  #   xkbVariant = "euro";
  # };

  # Enable Hyprland desktop manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk];

  services.tailscale.enable = true;

  # Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  services.udev.packages = with pkgs; [
    # via
    vial
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ugo = {
    isNormalUser = true;
    description = "Ugo Proietti";
    extraGroups = [ "networkmanager" "wheel" "dialout" "docker"];
    packages = with pkgs; [
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ugo" = import ../users/ugo/home.nix;
    };
  };

  home-manager.backupFileExtension = "backup";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable bluetooth support and blueman-applet
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    brightnessctl
    btop
    git
    grim
    kitty
    neofetch
    nixd
    # nodejs
    polkit_gnome
    ripgrep
    slurp
    swaybg
    unzip
    via
    vial
    vim
    wl-clipboard
    wget
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Font
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    google-fonts
  ];

  security.polkit.enable = true;

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  virtualisation.podman.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;


  nix.gc = {
    automatic = true;  # Enable the automatic garbage collector
    options = "--delete-older-than 60d";    # Arguments to pass to nix-collect-garbage
  };
  nix.optimise = {
    automatic = true;
  };

  system.stateVersion = "24.05";
}
