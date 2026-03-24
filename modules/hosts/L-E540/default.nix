{ self, inputs, ... }: {
  flake.nixosConfigurations.L-E540 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.L-E540Configuration
    ];
  };
}
