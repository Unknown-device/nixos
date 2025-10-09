{ pkgs, ... }: {

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    };
    environment.sessionVariables = {
    NH_OS_FLAKE = "/home/hadi-io/.config/nixos";
    NH_HOME_FLAKE = "/home/hadi-io/.config/nixos";
    };
}
