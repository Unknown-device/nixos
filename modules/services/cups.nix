{pkgs, ...}:
{
programs.system-config-printer.enable = true;

services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

services.printing = {
  enable = true;
  drivers = with pkgs; [
    cups-filters
    cups-browsed
  ];
};

services.system-config-printer.enable = true;
}

