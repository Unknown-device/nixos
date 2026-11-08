{ self, inputs, ... }:
{

  flake.nixosModules.L-E5470Configuration =
    { pkgs, lib, ... }:
    {
      # import any other modules from here
      imports = [
        self.nixosModules.caps-esc
        self.nixosModules.L-E5470Hardware
        self.nixosModules.Virtualization
        self.nixosModules.nh
        self.nixosModules.base
        self.nixosModules.shell
        self.nixosModules.cli
        self.nixosModules.nvf
      ];

      environment.systemPackages = with pkgs; [
        xwayland-satellite # system/wayland component
        firefox # GUI
        helix
        kitty # terminal emulator (GUI)
        vesktop # GUI (Discord client)
        bibata-cursors # theme
        zoom-us
        self.packages.${pkgs.system}.noctalia-shell
      ];

      programs.niri.enable = true;
      programs.niri.package = self.packages."${pkgs.system}".niri;
      services.displayManager.ly.enable = true;

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      services.upower.enable = true;

      hardware.bluetooth = {
        enable = true;
        settings = {
          General = {
            Experimental = true;
            FastConnectable = true;
          };
        };
      };

      services.power-profiles-daemon.enable = true;

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
        extraGroups = [
          "networkmanager"
          "wheel"
          "dialout"
        ];
      };

      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.allowUnsafe = true;

      services.esphome.enable = true;

      system.stateVersion = "25.05";
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
