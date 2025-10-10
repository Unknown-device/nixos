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
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    spicetify-nix,
    stylix,
    zen-browser,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit spicetify-nix stylix;
      };

      modules = [
        ./hosts/L-E5470/L-E5470.nix
        stylix.nixosModules.stylix
        spicetify-nix.nixosModules.default

        {
          environment.systemPackages = [
            zen-browser.packages.${system}.twilight
            inputs.noctalia.packages.${system}.default
          ];
        }
      ];
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
