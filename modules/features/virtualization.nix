{self, inputs, ...}: {
flake.nixosModules.Virtualization = { config, lib, pkgs, modulesPath, ... }:
virtualisation.libvirtd = {
    enable = true;

    # Enable TPM emulation (for Windows 11)
    qemu = {
      swtpm.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

  # Enable USB redirection
  virtualisation.spiceUSBRedirection.enable = true;
}

# Allow VM management
users.groups.libvirtd.members = [ "hadi-io" ];
users.groups.kvm.members = [ "hadi-io" ];

# Enable VM networking and file sharing
environment.systemPackages = with pkgs; [
    # ... your other packages ...
    gnome-boxes # VM management
    dnsmasq # VM networking
    phodav # (optional) Share files with guest VMs
];

}

