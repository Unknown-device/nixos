{ self, inputs, ... }: {
  flake.nixosConfigurations.L-E5470 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.L-E5470Configuration
    ];
  };
}
