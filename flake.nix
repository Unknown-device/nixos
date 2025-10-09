{
  description = "Merged NixOS + Home Manager flake with Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nvf.url = "github:notashelf/nvf?ref=v0.8";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs = {
    spicetify-nix,
    nixpkgs,
    home-manager,
    zen-browser,
    stylix,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/L-E5470/L-E5470.nix
        stylix.nixosModules.stylix
        spicetify-nix.nixosModules.default
        ({pkgs, ...}: {
          environment.systemPackages = with pkgs; [
            zen-browser.packages.${pkgs.system}.twilight
            inputs.noctalia.packages.${system}.default
          ];
        })
      ];

      specialArgs = {
        inherit spicetify-nix;
        inherit stylix;
      };
    };

    homeConfigurations."hadi-io" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        nvf.homeManagerModules.default
        ./home/home.nix
        spicetify-nix.homeManagerModules.default
      ];

      extraSpecialArgs = {
        inherit spicetify-nix;
      };
    };
  };
}
