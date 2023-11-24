{
  description = "Harun's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, ...}: {
    nixosConfigurations = {
      pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos-modules/common.nix
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.hsheikhali = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
          }
        ];
      };
    };
    homeConfiguration = {
      "hsheikhali@nixos" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            hyprland.homeManagerModules.default
            {wayland.windowManager.hyprland.enable = true;}
        ];
      };
    };
  };
}
