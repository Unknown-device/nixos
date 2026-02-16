{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce ../../misc/noctalia.json;
    colors = lib.mkForce ../../misc/colors.json;
  };
}
