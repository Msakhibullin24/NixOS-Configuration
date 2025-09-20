{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ayugram-desktop.url = "github:ayugram-port/ayugram-desktop";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-overlay = import ./pkgs;
      ayugram-overlay = final: prev: {
        inherit (inputs.ayugram-desktop.packages.${system}) ayugram-desktop;
      };
      utillinux-overlay = final: prev: {
        utillinux = prev.util-linux;
      };

      overlays = [
        pkgs-overlay
        ayugram-overlay
        utillinux-overlay
      ];

      stable-overlay = final: prev: {
        stable = import nixpkgs-stable {
          inherit system overlays;
          config.allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays ++ [ stable-overlay ];
        config.allowUnfree = true;
      };

      username = "robot";

      flavor = "mocha";
      cursor-flavor = "mocha";
      accent = "pink";
      cursor-accent = "pink";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit
            username
            flavor
            accent
            cursor-flavor
            cursor-accent
            ;
        };

        modules = [
          ./nixos/configuration.nix
          inputs.nixvim.nixosModules.nixvim
          inputs.sddm-sugar-candy-nix.nixosModules.default
          inputs.catppuccin.nixosModules.catppuccin
        ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit
            username
            flavor
            accent
            cursor-flavor
            cursor-accent
            ;
        };

        modules = [
          ./home-manager/home.nix
          inputs.nixvim.homeModules.nixvim
          inputs.catppuccin.homeModules.catppuccin
        ];
      };
    };
}
