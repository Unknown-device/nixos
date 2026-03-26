{ self, inputs, ... }: {

  flake.nixosModules.L-E540Configuration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.L-E540Hardware
      self.nixosModules.caps-esc
      self.nixosModules.nh

      self.nixosModules.firefox
    ];

  services.displayManager.ly = {
    enable = true;
  };

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      ubuntu-sans
      cm_unicode
      corefonts
      unifont
    ];

    fonts.fontconfig.defaultFonts = {
      serif = ["Ubuntu Sans"];
      sansSerif = ["Ubuntu Sans"];
      monospace = ["JetBrainsMono Nerd Font"];
    };
 
  environment.sessionVariables.XDG_DATA_DIRS = ["${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}" "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"];
  nix.settings.auto-optimise-store = true;

  programs.virt-manager.enable = true;
users.groups.libvirtd.members = ["hadi-io"];
virtualisation.libvirtd.enable = true;
virtualisation.spiceUSBRedirection.enable = true;

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
  documentation.man.cache.enable = false;
  environment.systemPackages = with pkgs; [
git
    dig
    app2unit
    xwayland-satellite
    bluez-tools
    gsettings-desktop-schemas
    dconf
    ntfs3g
vim
firefox
kitty
      vesktop
bibata-cursors
    openjdk
        file
        unzip
        zip
        p7zip
        wget
        killall
        sshfs
        fzf
        htop
        btop
        eza
        fd
        dust
        ripgrep
        neofetch
        tree-sitter
        imagemagick
        imv
        ffmpeg-full
        yt-dlp
        lazygit
  ];

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;
programs.niri.enable = true;
programs.niri.package = self.packages."${pkgs.system}".niri; 
programs.zoxide.enable = true;

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
  
nix.settings = {
  extra-substituters = [ "https://noctalia.cachix.org" "https://nix-community.cachix.org" ];
  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
};

  };
}
