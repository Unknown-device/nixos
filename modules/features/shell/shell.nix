{self, ...}: {
  flake.nixosModules.cli = { ... }: {
  imports = [ self.nixosModules.cli ];
  };
  }
