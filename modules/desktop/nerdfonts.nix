{ config, pkgs, ... }:

{
  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    fira-code
    _3270
  ];
}

