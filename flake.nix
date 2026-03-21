{  
  description = "Unknown-device NixOS Configuration with flake-parts";

  inputs = {  
    flake-parts.url = "github:hercules-ci/flake-parts";
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

  outputs = inputs@{  
    self,
    flake-parts,
    nixpkgs,
    home-manager,
    stylix,
    zen-browser,
    nvf,
    spicetify-nix,
    lazyvim,
    ...  
  }:  
    flake-parts.lib.mkFlake {inherit inputs;} {  
      systems = ["x86_64-linux"];  

      perSystem = {  
        config,
        self',
        inputs',
        pkgs,
        system,
        ...  
      }: {  
        # Per-system packages and devShells can go here  
      };  

      flake = {  
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {  
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
          modules = [  
            ./hosts/L-E5470/L-E5470.nix
            stylix.nixosModules.stylix
            {  
              environment.systemPackages = [  
                zen-browser.packages."x86_64-linux".twilight  
              ];  
            }  
          ];  
        };  

        homeConfigurations."hadi-io" =  
          home-manager.lib.homeManagerConfiguration {  
            pkgs = import nixpkgs {system = "x86_64-linux";};  
            modules = [  
              nvf.homeManagerModules.default  
              ./home/home.nix  
              spicetify-nix.homeManagerModules.default  
              stylix.homeModules.stylix  
              lazyvim.homeManagerModules.default  
            ];  

            extraSpecialArgs = {  
              inherit inputs;  
              inherit spicetify-nix;  
            };  
          };  
      };  
    };  
}