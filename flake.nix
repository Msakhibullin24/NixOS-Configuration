{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };

      modules = [
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
        inputs.sddm-sugar-candy-nix.nixosModules.default
        inputs.catppuccin.nixosModules.catppuccin
      ];
    };

    homeConfigurations.darkangel = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      extraSpecialArgs.pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      modules = [
        ./home-manager/home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
  };
}
