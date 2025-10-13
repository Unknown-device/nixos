{...}: {
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.thermald.enable = true;
  services.logind.lidSwitch = "suspend";
  powerManagement.powertop.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
  boot.kernelParams = ["mem_sleep_default=deep" "ahci.mobile_lpm_policy=0" "intel_iommu=off"];
}
