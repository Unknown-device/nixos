{ pkgs, inputs, config, ... }:
{
  # install pacakge
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    # ... maybe other stuff
  ];
}
