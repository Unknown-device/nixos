{
  flake.nixosModules.nh = {pkgs, ...}: {
programs.nh.enable = true;
programs.nh.clean.enable = true;
programs.nh.clean.extraArgs = "--keep 5 --keep-since 3d";
programs.nh.flake = "/home/hadi-io/.config/nixos";
      };
}
