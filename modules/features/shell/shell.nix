{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.cli
        self.nixosModules.starship
      ];
     programs.fish.shellAliases = {
        cd = "z";
        ls = "eza --icons";
        ll = "eza -l --icons";
        la = "eza -a --icons";
        lt = "eza --tree --icons";
        lla = "eza -la --icons";
      };

      environment.systemPackages = [
        inputs.self.packages.${pkgs.system}.kitty
      ];
    };
}
