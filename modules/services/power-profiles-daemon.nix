{...}: {
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.thermald.enable = true;
  services.logind.lidSwitch = "suspend";
  powerManagement.powertop.enable = true;
}
