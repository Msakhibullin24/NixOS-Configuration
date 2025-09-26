{
  description = "Taras's NixOS Flake Configuration";

  inputs = {
    # This points to the unstable channel of Nix packages.
    # Your configuration.nix seems to use recent packages, so unstable is a good choice.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    my-packages.url = "github:2taras/nix-pkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, my-packages, ... }@inputs: {

    # This is the part the error message was looking for.
    # It defines the system configuration for your host named "tarpc".
    nixosConfigurations.tarpc = nixpkgs.lib.nixosSystem {
      
      system = "x86_64-linux";
      
      # This is the important part: it tells the flake to use
      # your existing configuration.nix as a module to build the system.

      specialArgs = {
        stable = import nixpkgs-stable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };

      modules = [
        ({ pkgs, system, ... }: 
        let
          stable-pkgs = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        in {
          nixpkgs.overlays = [
            # Your existing overlay for termius
            (final: prev: {
              inherit (my-packages.packages.${prev.system}) termius pulseview;
              # Override amneziavpn with stable version
              amneziavpn = stable-pkgs.amneziavpn;
            })

            (final: prev: {
              stable = import nixpkgs-stable {
                system = prev.system;
                config.allowUnfree = true;
              };
            })
          ];
        })

        ./configuration.nix
      ];
    };
  };
}
