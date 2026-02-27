{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nvf.url = "github:notashelf/nvf";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    spicetify-nix,
    stylix,
    zen-browser,
    nvf,
    lazyvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/L-E5470/L-E5470.nix

        stylix.nixosModules.stylix
        {
          environment.systemPackages = [
            zen-browser.packages.${system}.twilight
            inputs.nix-alien.packages.${system}.nix-alien
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
        stylix.homeModules.stylix
        lazyvim.homeManagerModules.default
      ];

      extraSpecialArgs = {
        inherit spicetify-nix;
        inherit inputs;
      };
    };
  };
}
