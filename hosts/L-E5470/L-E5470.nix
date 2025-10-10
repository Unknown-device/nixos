{pkgs, ...}: {
  imports = [
    ../../hardware/hardware-configuration.nix
    ../../modules/desktop/niri.nix
    ../../modules/services/power-profiles-daemon.nix
    ../../modules/desktop/pipewire.nix
    ../../modules/desktop/nh.nix
    ../../modules/desktop/stylix.nix
    ../../modules/desktop/alias.nix
    ../../modules/services/cups.nix
  ];

  services.displayManager.ly.enable = true;
  services.power-profiles-daemon.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.hadi-io = {
    isNormalUser = true;
    description = "hadi";
    extraGroups = ["networkmanager" "wheel"];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  documentation.man.generateCaches = false;
  environment.systemPackages = with pkgs; [
    home-manager
    dig
    app2unit
  ];

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
