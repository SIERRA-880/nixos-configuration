{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        ugo-laptop = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./configuration.nix
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}
          ];
        };
      };
    };
}
